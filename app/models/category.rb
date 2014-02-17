class Category < ActiveRecord::Base
  attr_accessible :name

  has_many :tags

  has_many :restaurants,
  through: :tags,
  source: :restaurant
end
