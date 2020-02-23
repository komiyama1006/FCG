class AddCardInformationToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :card_information, :string
  end
end
