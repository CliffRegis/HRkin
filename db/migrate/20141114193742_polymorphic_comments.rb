class PolymorphicComments < ActiveRecord::Migration
  def up
    add_column :comments, :commentable_id, :integer
    add_column :comments, :commentable_type, :string
    add_index :comments, [:commentable_id, :commentable_type]
  end

  def down
    remove_column :comments, :commentable_id, :integer
    remove_column :comments, :commentable_type, :string
  end
end
