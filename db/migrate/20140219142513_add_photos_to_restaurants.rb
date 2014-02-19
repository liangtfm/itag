class AddPhotosToRestaurants < ActiveRecord::Migration
  def self.up
    change_table :restaurants do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :restaurants, :photo
  end
end
