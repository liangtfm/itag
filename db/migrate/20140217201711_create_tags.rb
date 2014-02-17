class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.integer :category_id, null: false
      t.integer :restaurant_id, null: false

      t.timestamps
    end

    add_index :tags, :category_id
    add_index :tags, :restaurant_id
  end
end
