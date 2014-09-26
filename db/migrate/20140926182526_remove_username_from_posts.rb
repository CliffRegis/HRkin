class RemoveUsernameFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :username
  end
end
