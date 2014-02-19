class Vote < ActiveRecord::Base
  attr_accessible :name

  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :vote_tags

  has_many :users,
  through: :vote_tags,
  source: :user

end
