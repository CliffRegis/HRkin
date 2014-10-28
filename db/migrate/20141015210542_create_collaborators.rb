class CreateCollaborators < ActiveRecord::Migration
  def change
    create_table :collaborations do |t|
      t.integer :user_id
      t.integer :page_id
      t.integer :supporter_id
      t.integer :supported_id
      t.timestamps
    end
    add_index :collaborations, :user_id
    add_index :collaborations, :page_id
    
   
  end
end
