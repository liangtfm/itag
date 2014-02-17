class Restaurant < ActiveRecord::Base
  attr_accessible :name, :website, :price, :phone, :street, :city, :state, :zip, :open, :category_ids

  validates :name, :street, :city, :state, presence: true

  validates :name, :uniqueness => {:scope => :street}

  has_many :tags

  has_many :categories,
  through: :tags,
  source: :category

end
