class RemovePersistentTokenFromUsers < ActiveRecord::Migration
   def change
    remove_column :users, :persistent_token
  end
end
