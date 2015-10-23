require 'rails_helper'
require 'faker'

RSpec.describe 'API:V1/users', type: :request do
  describe 'GET /v1/users' do
    before :each do
      @role = FactoryGirl.create(:role, name: 'admin')
      @user = FactoryGirl.create(:user, role: @role)
    end

    it 'should return an array with at least one user' do
      get '/v1/users.json', access_token: @user.authentication_token
      expect(response.content_type).to eq('application/json')
      expect(response).to be_success
      expect(json.length).to be >= 1
    end

    it 'should create a new user' do
      email = Faker::Internet.email
      post '/v1/users.json', access_token: @user.authentication_token, email: email, password: Faker::Internet.password
      expect(response.content_type).to eq('application/json')
      expect(response).to be_success
      expect(json['email']).to eq(email)
    end
  end
end
