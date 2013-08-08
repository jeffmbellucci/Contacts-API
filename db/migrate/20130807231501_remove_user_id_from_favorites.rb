class RemoveUserIdFromFavorites < ActiveRecord::Migration
  def up
    remove_column :favorites, :user_id
  end

  def down
    add_column :favorites, :user_id, :integer
  end
end
