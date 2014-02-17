class Restaurant < ActiveRecord::Base
  attr_accessible :name, :website, :price, :phone, :street, :city, :state, :zip, :open

  validates :name, :street, :city, :state, presence: true

  validates :name, :uniqueness => {:scope => :street}

end
