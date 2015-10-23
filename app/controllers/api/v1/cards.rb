module API
  module V1
    class Cards < Grape::API
      include API::V1::Defaults

      resource :cards do
        desc 'Return a list of cards', entity: Entities::Card
        get do
          if params[:faction_id]
            cards = Card.where(faction_id: params[:faction_id])
          else
            cards = Card.all
          end
          present cards, with: Entities::Card, type: entity_type
        end

        desc 'Return a card', entity: Entities::Card
        get ':id' do
          present Card.find(params[:id]), with: Entities::Card, type: entity_type
        end

        desc 'Create a new card', entity: Entities::Card
        params do
          requires :faction_id, type: String, desc: 'Faction ID'
          requires :name, type: String, desc: 'Card name'
          optional :slug, type: String, desc: 'Identifier'
          requires :obtain, type: String, desc: 'Method of getting card'
          optional :territory, type: String, desc: 'Territory in which to find card'
          optional :quest, type: String, desc: 'Quest in which card can be obtained'
          optional :location, type: String, desc: 'How to obtain the card'
          requires :starter, type: Boolean, desc: 'Included at start of game'
        end
        post do
          error!('401 Unauthorized', 401) unless admin?
          present Card.create(
            faction: Faction.find(params[:faction_id]),
            name: params[:name],
            slug: params[:slug],
            obtain: params[:obtain],
            territory: params[:territory],
            quest: params[:quest],
            location: params[:location],
            starter: params[:starter]
          ), with: Entities::Card, type: entity_type
        end

        desc 'Update a card', entity: Entities::Card
        params do
          requires :name, type: String, desc: 'Card name'
          optional :slug, type: String, desc: 'Identifier'
          requires :obtain, type: String, desc: 'Method of getting card'
          optional :territory, type: String, desc: 'Territory in which to find card'
          optional :quest, type: String, desc: 'Quest in which card can be obtained'
          optional :location, type: String, desc: 'How to obtain the card'
          requires :starter, type: Boolean, desc: 'Included at start of game'
        end
        put ':id' do
          error!('401 Unauthorized', 401) unless admin?
          card = Card.find(params[:id])
          card.update(
            name: params[:name],
            slug: params[:slug],
            obtain: params[:obtain],
            territory: params[:territory],
            quest: params[:quest],
            location: params[:location],
            starter: params[:starter]
          )
          present card, with: Entities::Card, type: entity_type
        end

        desc 'Delete a card'
        params do
          requires :id, type: String, desc: 'Card ID'
        end
        delete ':id' do
          error!('401 Unauthorized', 401) unless admin?
          Card.find(params[:id]).destroy
          {}
        end
      end
    end
  end
end
