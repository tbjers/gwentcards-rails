require 'rails_helper'

RSpec.describe Card, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:card)).to be_valid
  end
  it 'is invalid without a name' do
    expect(FactoryGirl.build(:card, name: nil)).to_not be_valid
  end
end
