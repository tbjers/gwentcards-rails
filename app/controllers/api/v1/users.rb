module API
  module V1
    class Users < Grape::API
      include API::V1::Defaults

      resource :users do
        desc 'Return a list of users', entity: Entities::User
        get do
          error!('401 Unauthorized', 401) unless admin?
          present User.all, with: Entities::User, type: entity_type
        end

        desc 'Create a new user', entity: Entities::User
        params do
          requires :email, type: String, desc: 'User email'
          requires :password, type: String, desc: 'User password'
        end
        post do
          error!('401 Unauthorized', 401) unless admin?
          @user = User.new(email: params[:email], password: params[:password], password_confirmation: params[:password])
          @user.save
          present @user, with: Entities::User, type: entity_type
        end

        desc 'Add a card to the current user', entity: Entities::User
        params do
          requires :card_id, type: String, desc: 'Card ID'
        end
        post 'card/:card_id' do
          card = Card.find(params[:card_id])
          current_user.cards << card
        end

        desc 'Remove a card from the current user', entity: Entities::User
        params do
          requires :card_id, type: String, desc: 'Card ID'
        end
        delete 'card/:card_id' do
          card = Card.find(params[:card_id])
          current_user.cards.delete card
        end
      end
    end
  end
end
