class CreateRentalLists < ActiveRecord::Migration[5.2]
  def change
    create_table :rental_lists do |t|


      t.timestamps
    end
  end
end
