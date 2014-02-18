class Restaurant < ActiveRecord::Base
  attr_accessible :name, :website, :price, :phone, :street, :city_id, :zip, :open, :category_ids

  validates :name, :street, :city_id, presence: true

  validates :name, uniqueness: {:scope => :street, :message => "That listing already exists!"}

  has_many :tags

  has_many :categories,
  through: :tags,
  source: :category

  has_many :reviews

  has_many :reviewers,
  through: :reviews,
  source: :user

  belongs_to :city

  has_one :state,
  through: :city

end
