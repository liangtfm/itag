class AddAuthTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :activated, :boolean, :default => false
    add_column :users, :auth_token, :string
    add_index :users, :auth_token
    add_index :users, :session_token
  end
end
