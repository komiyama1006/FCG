class RemoveColorFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :color, :integer
  end
end
