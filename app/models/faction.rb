class Faction
  include Mongoid::Document
  include BaseObject

  field :name, type: String
  field :slug, type: String

  validates :name, presence: true

  before_save :ensure_slug!

  has_many :cards

  index({ slug: 1 }, unique: true)
end
