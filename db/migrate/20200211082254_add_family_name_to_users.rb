class AddFamilyNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :family_name, :string
    add_column :users, :first_name, :string
    add_column :users, :family_name_kana, :string
    add_column :users, :first_name_kana, :string
    add_column :users, :post_number, :string
    add_column :users, :address, :text
    add_column :users, :tel, :string
  end
end
