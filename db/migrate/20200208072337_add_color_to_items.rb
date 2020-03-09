class AddColorToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :color, :string
    add_column :items, :lens_width, :integer
    add_column :items, :lens_length, :integer
    add_column :items, :bridge, :integer
    add_column :items, :temple, :integer
    add_column :items, :production, :string
  end
end
