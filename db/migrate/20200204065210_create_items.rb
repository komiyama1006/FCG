class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.text :name
      t.string :color
      t.text :body

      t.timestamps
    end
  end
end
