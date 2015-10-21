require 'rails_helper'
require 'faker'

RSpec.describe 'API:V1/factions', type: :request do
  describe 'GET /v1/factions' do
    before :each do
      @role = FactoryGirl.create(:role, name: 'admin')
      @admin = FactoryGirl.create(:user, role: @role)
      @user = FactoryGirl.create(:user)
      @faction = FactoryGirl.create(:faction)
    end

    it 'should return an array with several factions' do
      get '/v1/factions.json', access_token: @user.authentication_token
      expect(response.content_type).to eq('application/json')
      expect(response).to be_success
      expect(json['factions'].length).to be >= 1
    end

    it 'retrieves a specific faction' do
      get "/v1/factions/#{@faction.id}.json", access_token: @user.authentication_token
      expect(response).to be_success
      expect(json['faction']['name']).to eq(@faction.name)
    end

    it 'retrieves a specific faction with entity_type full' do
      get "/v1/factions/#{@faction.id}.json", access_token: @user.authentication_token, full: 'true'
      expect(response).to be_success
      expect(json['faction']['name']).to eq(@faction.name)
    end

    it 'should create a new faction' do
      faction = FactoryGirl.build(:faction)
      post '/v1/factions.json', access_token: @admin.authentication_token, faction: { name: faction.name }
      expect(response.content_type).to eq('application/json')
      expect(response).to be_success
      expect(json['faction']['name']).to eq(faction.name)
    end

    it 'updates a specific faction' do
      new_name = Faker::Lorem.sentence
      put "/v1/factions/#{@faction.id}.json", access_token: @admin.authentication_token, faction: { name: new_name }
      expect(response).to be_success
      expect(json['faction']['name']).to eq(new_name)
    end

    it 'deletes a specific faction' do
      delete "/v1/factions/#{@faction.id}.json", access_token: @admin.authentication_token
      expect(response).to be_success
      expect(json).to eq({})
    end

    it 'retrieves cards for a specific faction' do
      get "/v1/factions/#{@faction.id}/cards.json", access_token: @user.authentication_token
      expect(response).to be_success
    end
  end
end
