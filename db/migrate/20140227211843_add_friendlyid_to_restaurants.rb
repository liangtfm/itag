class AddFriendlyidToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :slug, :string
    add_index :restaurants, :slug, :unique => true
  end
end