class CreateCollaborations < ActiveRecord::Migration
  def change
    create_table :collaborations do |t|
      t.integer :supported_id
      t.integer :supporter_id

      t.timestamps
    end
    
  end
end
