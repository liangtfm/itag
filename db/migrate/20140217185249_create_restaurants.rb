class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name, null: false
      t.string :website
      t.integer :price
      t.integer :phone
      t.string :street, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.integer :zip
      t.boolean :open, default: true
      t.timestamps
    end
  end
end
