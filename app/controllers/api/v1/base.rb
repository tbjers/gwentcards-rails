module API
  module V1
    class Base < Grape::API
      mount Users
      mount Factions
      mount Cards

      if Rails.env.test?
        get '/v1/error' do
          fail 'error'
        end
      end

      add_swagger_documentation(
        api_version: 'v1',
        hide_documentation_path: true,
        mount_path: '/v1/swagger_doc',
        hide_format: true
      )
    end
  end
end
