class AddUserIdToRentalLists < ActiveRecord::Migration[5.2]
  def change
    add_column :rental_lists, :user_id, :integer
  end
end
