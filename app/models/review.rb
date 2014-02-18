class Review < ActiveRecord::Base
  attr_accessible :title, :body, :rating, :user_id, :restaurant_id

  validates :title, :body, :rating, :user_id, :restaurant_id, presence: true
  validates :restaurant_id, uniqueness: { :scope => :user_id, :message => "You already wrote a review for this place!" }

  belongs_to :restaurant

  belongs_to :user

end
