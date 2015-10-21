require 'rails_helper'

RSpec.describe Role, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:role)).to be_valid
  end
  it 'is invalid without a name' do
    expect(FactoryGirl.build(:role, name: nil)).to_not be_valid
  end
end
