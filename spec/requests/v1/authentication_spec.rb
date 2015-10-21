require 'rails_helper'
require 'faker'

RSpec.describe 'API:V1:Authentication', type: :request do
  describe 'GET /v1/factions' do
    before :each do
      @password = Faker::Internet.password
      @user = FactoryGirl.create(:user, password: @password)
    end

    it 'should return a 401 with no access_token specified' do
      get '/v1/factions'
      expect(response).to have_http_status(401)
    end
    it 'should return a 401 with invalid access_token specified' do
      get '/v1/factions', access_token: 'foo'
      expect(response).to have_http_status(401)
    end
    it 'should return a 200 with valid access_token specified' do
      get '/v1/factions', access_token: @user.authentication_token
      expect(response).to be_success
    end
    it 'should return a 200 with valid access_token specified in Authorization header' do
      get '/v1/factions', nil, 'HTTP_AUTHORIZATION': 'Bearer ' + @user.authentication_token
      expect(response).to be_success
    end
    it 'should report an error for missing email' do
      post '/sessions', email: nil, password: @password
      expect(response).to have_http_status(401)
      expect(json['error_message']).to eq('Invalid Email or Password')
    end
    it 'should report an error for missing parameters' do
      post '/sessions'
      expect(response).to have_http_status(500)
    end
    it 'should report an error for missing password' do
      post '/sessions', email: @user.email, password: nil
      expect(response).to have_http_status(401)
      expect(json['error_message']).to eq('Invalid Email or Password')
    end
    it 'should report an error for user not found' do
      post '/sessions', email: 'foo', password: @password
      expect(response).to have_http_status(401)
      expect(json['error_message']).to eq('Invalid Email or Password')
    end
    it 'should report an error for faulty password' do
      post '/sessions', email: @user.email, password: 'foo'
      expect(response).to have_http_status(401)
      expect(json['error_message']).to eq('Invalid Email or Password')
    end
    it 'should log the user in and return an access_token' do
      post '/sessions.json', email: @user.email, password: @password
      expect(response).to be_success
      expect(json['token']).to eq(@user.authentication_token)
    end
    it 'should fail to destroy the access_token' do
      delete '/sessions.json', access_token: 'foo'
      expect(response).to have_http_status(401)
      expect(json['response']['error_message']).to eq('Invalid access token')
    end
    it 'should destroy the access_token' do
      delete '/sessions.json', access_token: @user.authentication_token
      expect(response).to be_success
    end
  end
end
