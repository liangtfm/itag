class State < ActiveRecord::Base
  attr_accessible :name

  validates :name, presence: true
  validate :name, uniqueness: true

  has_many :cities
end
