class AddPersistentTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :persistent_token, :string
  end
end
