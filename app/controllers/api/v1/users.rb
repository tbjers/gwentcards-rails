module API
  module V1
    class Users < Grape::API
      include API::V1::Defaults

      before do
        error!('401 Unauthorized', 401) unless admin?
      end

      resource :users do
        desc 'Return a list of users', entity: Entities::User
        get do
          present User.all, with: Entities::User, type: entity_type
        end

        desc 'Create a new user', entity: Entities::User
        params do
          requires :user, type: Hash do
            requires :email, type: String, desc: 'User email'
            requires :password, type: String, desc: 'User password'
          end
        end
        post do
          @user = User.new(email: params[:user][:email], password: params[:user][:password], password_confirmation: params[:user][:password])
          @user.save
          present @user, with: Entities::User, type: entity_type
        end
      end
    end
  end
end
