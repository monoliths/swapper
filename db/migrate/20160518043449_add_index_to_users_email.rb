class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
    # this ensures unique values down to the db level
    add_index :users, :email, unique: true
  end
end
