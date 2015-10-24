module API
  module V1
    module Entities
      class User < BaseEntity
        expose :email, documentation: { type: String, required: true }
        expose :cards, if: { type: :full }, using: Card, documentation: { type: 'cards', required: true }
      end
    end
  end
end
