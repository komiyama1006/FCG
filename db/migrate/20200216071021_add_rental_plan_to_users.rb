class AddRentalPlanToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :rental_plan, :string
  end
end
