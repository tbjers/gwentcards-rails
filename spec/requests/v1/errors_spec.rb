require 'rails_helper'

RSpec.describe 'API:V1:Error', type: :request do
  describe 'GET /v1/error' do
    before :each do
      @user = FactoryGirl.create(:user)
    end

    it 'should return a 500' do
      get '/v1/error', access_token: @user.authentication_token
      expect(response).to have_http_status(500)
    end
  end
end
