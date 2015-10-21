module API
  class Base < Grape::API
    rescue_from :all, backtrace: true do |e|
      Rollbar.error(e)
      error!(error: e.class.name, message: e.message)
    end
    error_formatter :json, API::ErrorFormatter

    before do
      if request.headers.include?('Authorization')
        params[:access_token] = request.headers['Authorization'].gsub(/^Bearer /, '')
      end
      error!('401 Unauthorized', 401) unless authenticated
    end

    helpers do
      def warden
        env['warden']
      end

      def authenticated
        return true if warden.authenticated?
        params[:access_token] && @user = User.find_by(authentication_token: params[:access_token])
      end

      def current_user
        warden.user || @user
      end

      def admin?
        current_user && current_user.role.name == 'admin'
      end

      def to_boolean(str)
        str == 'true' || str == '1'
      end

      def entity_type
        to_boolean(params[:full]) == true ? :full : :default
      end
    end

    mount V1::Base
  end
end
