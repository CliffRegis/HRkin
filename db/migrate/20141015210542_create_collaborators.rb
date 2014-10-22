class CreateCollaborators < ActiveRecord::Migration
  def change
    create_table :collaborators do |t|
      t.integer :user_id
      t.integer :page_id
      t.timestamps
    end
    add_index :collaborators, :user_id
    add_index :collaborators, :page_id
  end
end
