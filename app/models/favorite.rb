class Favorite < ActiveRecord::Base
  attr_accessible :user_id, :restaurant_id

  validates :user_id, :restaurant_id, presence: true
  validates :user_id, uniqueness: { scope: :restaurant_id, message: "You already favorited that place!" }

  belongs_to :user

  belongs_to :restaurant

end
