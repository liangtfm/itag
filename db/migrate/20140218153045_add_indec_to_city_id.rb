class AddIndecToCityId < ActiveRecord::Migration
  def change
        add_index :restaurants, :city_id
  end
end
