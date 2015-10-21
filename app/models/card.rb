class Card
  include Mongoid::Document
  include BaseObject

  field :name, type: String
  field :slug, type: String
  field :obtain, type: String
  field :territory, type: String
  field :quest, type: String
  field :location, type: String
  field :starter, type: Boolean

  validates :name, presence: true

  before_save :ensure_slug!

  belongs_to :faction

  index(faction_id: 1)
  index({ slug: 1 }, unique: true)
end
