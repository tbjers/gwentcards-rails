module API
  class Sessions < Grape::API
    rescue_from :all, backtrace: true do |e|
      Rollbar.error(e)
      error!(error: e.class.name, message: e.message)
    end
    error_formatter :json, API::ErrorFormatter

    get '/error' do
      raise PageAccessDenied
    end

    resource '' do
      desc 'Authenticate user and return user object / access token'
      params do
        optional :email, type: String, desc: 'User email'
        optional :password, type: String, desc: 'User password'
      end
      post do
        cache_control :private, :must_revalidate, max_age: 0

        email = params[:email]
        password = params[:password]

        if email.nil? || password.nil?
          error!({ error_code: 401, error_message: 'Invalid Email or Password' }, 401)
        end

        user = User.find_by(email: email.downcase)
        if user.nil?
          error!({ error_code: 401, error_message: 'Invalid Email or Password' }, 401)
        end

        if !user.valid_password?(password)
          error!({ error_code: 401, error_message: 'Invalid Email or Password' }, 401)
        else
          user.ensure_authentication_token!
          user.save
          { token: user.authentication_token, email: user.email, role: user.role.name }
        end
      end

      desc 'Destroy the access token'
      params do
        requires :access_token, type: String, desc: 'User access token'
      end
      delete do
        cache_control :private, :must_revalidate, max_age: 0

        access_token = params[:access_token]
        user = User.find_by(authentication_token: access_token)
        if user.nil?
          error!({ error_code: 404, error_message: 'Invalid access token' }, 401)
        else
          user.reset_authentication_token
        end
      end
    end
  end
end
