class CreateCollaborators < ActiveRecord::Migration
  def change
     
    create_table :collaborators do |t|
      t.references :page
      t.references :user
      t.timestamps
    end
  end
end
