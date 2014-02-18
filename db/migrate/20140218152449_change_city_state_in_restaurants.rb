class ChangeCityStateInRestaurants < ActiveRecord::Migration
  def change
    remove_column :restaurants, :city
    remove_column :restaurants, :state
  end
end
