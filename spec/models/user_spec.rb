require 'rails_helper'
require 'faker'

RSpec.describe User, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:user)).to be_valid
  end
  it 'has an authentication_token' do
    expect(FactoryGirl.create(:user).authentication_token).not_to be_empty
  end
  it 'has encrypted_password' do
    expect(FactoryGirl.create(:user).encrypted_password).not_to be_empty
  end
  it 'does not validate with a short password' do
    expect(FactoryGirl.build(:user, password: Faker::Internet.password(4))).not_to be_valid
  end
  it 'does not validate with a too long password' do
    expect(FactoryGirl.build(:user, password: Faker::Internet.password(90))).not_to be_valid
  end
  it 'does not allow duplicate emails' do
    email = Faker::Internet.email
    expect(FactoryGirl.create(:user, email: email)).to be_valid
    expect(FactoryGirl.build(:user, email: email)).not_to be_valid
  end
end
