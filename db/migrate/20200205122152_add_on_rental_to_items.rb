class AddOnRentalToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :on_rental, :boolean, default: true, null: false
  end
end
