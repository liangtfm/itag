class Category < ActiveRecord::Base
  attr_accessible :name

  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :tags

  has_many :restaurants,
  through: :tags,
  source: :restaurant

  include PgSearch
    multisearchable :against => [:name]

end
