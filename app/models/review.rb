class Review < ActiveRecord::Base
  attr_accessible :title, :body, :rating, :user_id, :restaurant_id

  validates :title, :body, :rating, :user_id, :restaurant_id, presence: true
  validates :restaurant_id, uniqueness: { :scope => :user_id, :message => "You already wrote a review for this place!" }
  validates :title, length: { minimum: 3, message: "title too short!" }
  validates :body, length: { minimum: 6, message: "body too short!" }

  belongs_to :restaurant

  belongs_to :user

  has_many :vote_tags

  has_many :users_who_voted,
  through: :vote_tags,
  source: :user

end
