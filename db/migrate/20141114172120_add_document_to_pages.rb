class AddDocumentToPages < ActiveRecord::Migration
  def change
    add_column :pages, :doccontent, :text
    add_index :pages, :user_id 
  end
end
