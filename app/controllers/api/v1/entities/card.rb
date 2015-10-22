module API
  module V1
    module Entities
      class Card < BaseEntity
        expose :name, documentation: { type: String, required: true }
        expose :slug, documentation: { type: String, required: true }
        expose :obtain, documentation: { type: String, required: true }
        expose :territory, documentation: { type: String, required: true }
        expose :quest, documentation: { type: String, required: true }
        expose :location, documentation: { type: String, required: true }
        expose :starter, documentation: { type: Boolean, required: true }
      end
    end
  end
end
