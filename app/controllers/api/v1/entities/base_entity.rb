module API
  module V1
    module Entities
      class BaseEntity < Grape::Entity
        expose :id, documentation: { type: String, required: true }, format_with: :to_string
        format_with(:to_string) { |s| s.to_s }
      end
    end
  end
end
