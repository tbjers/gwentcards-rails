GrapeSwaggerRails.options.app_name     = 'api.gwentcards.com'
GrapeSwaggerRails.options.url          = '/v1/swagger_doc'
GrapeSwaggerRails.options.app_url      = Rails.env.production? ? 'https://gwentcards.herokuapp.com' : 'http://localhost:3000'
GrapeSwaggerRails.options.api_key_name = 'access_token'
GrapeSwaggerRails.options.api_key_type = 'query'