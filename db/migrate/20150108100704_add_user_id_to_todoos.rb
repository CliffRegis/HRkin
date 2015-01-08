class AddUserIdToTodoos < ActiveRecord::Migration
  def change
    add_column :todoos, :user_id, :integer
    add_index :todoos, :user_id 
  end
end
