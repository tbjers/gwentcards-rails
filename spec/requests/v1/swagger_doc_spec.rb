require 'rails_helper'
require 'faker'

RSpec.describe 'API:V1/swagger_doc', type: :request do
  describe 'GET /v1/swagger_doc.json' do
    before :each do
      @user = FactoryGirl.create(:user)
    end

    it 'should not return anything without an access_token' do
      get '/v1/swagger_doc.json'
      expect(response.content_type).to eq('application/json')
      expect(response).to have_http_status(401)
    end

    it 'should return valid JSON' do
      get '/v1/swagger_doc.json', access_token: @user.authentication_token
      expect(response.content_type).to eq('application/json')
      expect(response).to be_success
    end
  end
end
