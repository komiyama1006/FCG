class AddItemIdToRentalLists < ActiveRecord::Migration[5.2]
  def change
    add_column :rental_lists, :item_id, :integer
  end
end
