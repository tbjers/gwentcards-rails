module API
  module V1
    module Entities
      class User < BaseEntity
        expose :email, documentation: { type: String, required: true }
      end
    end
  end
end
