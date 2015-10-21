module API
  module V1
    module Entities
      class Faction < BaseEntity
        root 'factions', 'faction'
        expose :name, documentation: { type: String, required: true }
        expose :slug, documentation: { type: String, required: true }
        expose :links do |faction, _options|
          links = {}
          %w(cards).each do |link|
            links[link] = "/v1/factions/#{faction.id}/#{link}"
          end
          links
        end
      end
    end
  end
end
