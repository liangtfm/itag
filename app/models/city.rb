class City < ActiveRecord::Base
  attr_accessible :name, :state_id

  validates :name, :state_id, presence: true
  validates :name, uniqueness: { scope: :state_id }

  belongs_to :state

  has_many :restaurants
end
