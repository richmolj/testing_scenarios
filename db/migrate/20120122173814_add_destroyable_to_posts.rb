class AddDestroyableToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :destroyable, :boolean
  end
end
