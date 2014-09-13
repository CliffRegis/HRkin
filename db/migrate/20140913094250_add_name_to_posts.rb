class AddNameToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :username, :string
    add_index :posts, :username
  end
end