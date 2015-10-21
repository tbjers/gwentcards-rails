require 'rails_helper'
require 'faker'

RSpec.describe 'API:V1/cards', type: :request do
  describe 'GET /v1/cards' do
    before :each do
      @role = FactoryGirl.create(:role, name: 'admin')
      @admin = FactoryGirl.create(:user, role: @role)
      @user = FactoryGirl.create(:user)
      @faction = FactoryGirl.create(:faction)
      @card = FactoryGirl.create(:card, faction: @faction)
    end

    it 'should return an array with at least one card' do
      get '/v1/cards.json', access_token: @user.authentication_token
      expect(response.content_type).to eq('application/json')
      expect(response).to be_success
      expect(json['cards'].length).to be >= 1
    end

    it 'should return an array with at least one card when using query param' do
      get '/v1/cards.json', access_token: @user.authentication_token, faction_id: @faction.id
      expect(response.content_type).to eq('application/json')
      expect(response).to be_success
      expect(json['cards'].length).to be >= 1
    end

    it 'retrieves a specific card' do
      get "/v1/cards/#{@card.id}.json", access_token: @user.authentication_token
      expect(response).to be_success
      expect(json['card']['name']).to eq(@card.name)
    end

    it 'retrieves a specific card with entity_type full' do
      get "/v1/cards/#{@card.id}.json", access_token: @user.authentication_token, full: 'true'
      expect(response).to be_success
      expect(json['card']['name']).to eq(@card.name)
      expect(json['card']['faction']).not_to be_nil
      expect(json['card']['faction']['name']).to eq(@faction.name)
    end

    it 'should create a new card' do
      card = FactoryGirl.build(:card)
      post '/v1/cards.json', access_token: @admin.authentication_token, card: { name: card.name, obtain: card.obtain, territory: card.territory, quest: card.quest, location: card.location, starter: card.starter, faction_id: @faction._id }
      expect(response.content_type).to eq('application/json')
      expect(response).to be_success
      expect(json['card']['name']).to eq(card.name)
    end

    it 'updates a specific card' do
      new_name = Faker::Lorem.sentence
      put "/v1/cards/#{@card.id}.json", access_token: @admin.authentication_token, card: { name: new_name, obtain: @card.obtain, territory: @card.territory, quest: @card.quest, location: @card.location, starter: @card.starter }
      expect(response).to be_success
      expect(json['card']['name']).to eq(new_name)
      expect(json['card']['obtain']).to eq(@card.obtain)
      expect(json['card']['territory']).to eq(@card.territory)
      expect(json['card']['quest']).to eq(@card.quest)
      expect(json['card']['location']).to eq(@card.location)
      expect(json['card']['starter']).to eq(@card.starter)
    end

    it 'should create a new card with a different slug' do
      post '/v1/cards.json', access_token: @admin.authentication_token, card: { name: @card.name, obtain: @card.obtain, territory: @card.territory, quest: @card.quest, location: @card.location, starter: @card.starter, faction_id: @faction._id }
      expect(response).to be_success
      expect(json['card']['name']).to eq(@card.name)
      expect(json['card']['slug']).to eq(@card.slug + '-1')
      expect(json['card']['obtain']).to eq(@card.obtain)
      expect(json['card']['territory']).to eq(@card.territory)
      expect(json['card']['quest']).to eq(@card.quest)
      expect(json['card']['location']).to eq(@card.location)
      expect(json['card']['starter']).to eq(@card.starter)
    end

    it 'deletes a specific card' do
      delete "/v1/cards/#{@card.id}.json", access_token: @admin.authentication_token
      expect(response).to be_success
      expect(json).to eq({})
    end
  end
end
