class Role
  include Mongoid::Document

  field :name, type: String

  validates :name, presence: true

  has_many :users

  index(name: 1)
end
