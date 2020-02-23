class AddPayCustomerIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :pay_customer_id, :string
  end
end
