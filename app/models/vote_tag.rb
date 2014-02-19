class VoteTag < ActiveRecord::Base
  attr_accessible :vote_id, :review_id, :user_id

  validates :vote_id, :review_id, :user_id, presence: true

  validates :user_id, uniqueness: { scope: :review_id, message: "You already upvoted this review!" }

  belongs_to :vote

  belongs_to :review

  belongs_to :user
end
