require 'rails_helper'

RSpec.describe 'Swagger', type: :request do
  describe 'GET /swagger' do
    it 'should return HTML' do
      get '/swagger'
      expect(response.content_type).to eq('text/html')
      expect(response).to be_success
    end
  end
end
