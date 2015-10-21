module API
  module V1
    class Factions < Grape::API
      include API::V1::Defaults

      resource :factions do
        desc 'Return a list of factions', entity: Entities::Faction
        get do
          present Faction.all, with: Entities::Faction, type: entity_type
        end

        desc 'Return a faction', entity: Entities::Faction
        get ':id' do
          present Faction.find(params[:id]), with: Entities::Faction, type: entity_type
        end

        desc 'Return cards for a faction', entity: Entities::Card
        get ':id/cards' do
          present Faction.find(params[:id]).cards, with: Entities::Card, type: entity_type
        end

        desc 'Create a new faction', entity: Entities::Faction
        params do
          requires :faction, type: Hash do
            requires :name, type: String, desc: 'Faction name'
            optional :slug, type: String, desc: 'Identifier'
          end
        end
        post do
          error!('401 Unauthorized', 401) unless admin?
          present Faction.create(
            name: params[:faction][:name],
            slug: params[:faction][:slug]
          ), with: Entities::Faction, type: entity_type
        end

        desc 'Update a faction', entity: Entities::Faction
        params do
          requires :faction, type: Hash do
            requires :name, type: String, desc: 'Faction name'
            optional :slug, type: String, desc: 'Identifier'
          end
        end
        put ':id' do
          error!('401 Unauthorized', 401) unless admin?
          faction = Faction.find(params[:id])
          faction.update(
            name: params[:faction][:name],
            slug: params[:faction][:slug]
          )
          present faction, with: Entities::Faction, type: entity_type
        end

        desc 'Delete a faction'
        params do
          requires :id, type: String, desc: 'Faction ID'
        end
        delete ':id' do
          error!('401 Unauthorized', 401) unless admin?
          Faction.find(params[:id]).destroy
          {}
        end
      end
    end
  end
end
