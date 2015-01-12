class AddPointToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :point, :float

  end
end
