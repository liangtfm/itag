class ChangePhoneAndZipAndPriceIntegerToStringRestaurants < ActiveRecord::Migration
  def up
    change_column :restaurants, :phone, :string
    change_column :restaurants, :zip, :string
    change_column :restaurants, :price, :string
  end

  def down
    change_column :restaurants, :phone, :integer
    change_column :restaurants, :zip, :integer
    change_column :restaurants, :price, :integer
  end
end
