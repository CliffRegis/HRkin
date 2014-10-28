class RenameCollaborators < ActiveRecord::Migration
  def change
    def self.up
      rename_table :collaborators, :collaborations
    end

    def self.down
      rename_table :collaborations, :collaborators
    end
  end
end
