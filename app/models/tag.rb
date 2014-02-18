class Tag < ActiveRecord::Base
  attr_accessible :restaurant_id, :category_id

  validates :restaurant_id, :category_id, presence: true
  validates :restaurant_id, uniqueness: { scope: :category_id }

  belongs_to :restaurant

  belongs_to :category
end
