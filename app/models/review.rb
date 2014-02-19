class Review < ActiveRecord::Base
  attr_accessible :title, :body, :rating, :user_id, :restaurant_id

  validates :title, :body, :rating, :user_id, :restaurant_id, presence: true
  validates :restaurant_id, uniqueness: { :scope => :user_id, :message => "You already wrote a review for this place!" }
  validates :title, length: { minimum: 3, message: "title too short!" }
  validates :body, length: { minimum: 6, message: "body too short!" }

  belongs_to :restaurant

  belongs_to :user

  def time_since_creation
    # method to return (TODAY - review.created_at) "5 minutes ago"
  end

end
