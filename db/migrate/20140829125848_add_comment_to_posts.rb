class AddCommentToPosts < ActiveRecord::Migration
  def change
   add_column :posts, :comments, :text
  end
end
