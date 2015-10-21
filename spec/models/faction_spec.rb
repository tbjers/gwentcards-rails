require 'rails_helper'

RSpec.describe Faction, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:faction)).to be_valid
  end
  it 'is invalid without a name' do
    expect(FactoryGirl.build(:faction, name: nil)).to_not be_valid
  end
end
