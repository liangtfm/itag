class Tag < ActiveRecord::Base
  attr_accessible :restaurant_id, :category_id

  belongs_to :restaurant

  belongs_to :category
end
