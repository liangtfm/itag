class CreateVoteTags < ActiveRecord::Migration
  def change
    create_table :vote_tags do |t|
      t.integer :vote_id, null: false
      t.integer :review_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end

    add_index :vote_tags, :vote_id
    add_index :vote_tags, :review_id
    add_index :vote_tags, :user_id
  end
end
