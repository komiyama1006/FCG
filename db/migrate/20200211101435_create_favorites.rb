class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.references :user, foreign_key: true
      t.references :item, foreign_key: true

      t.timestamps
      # 下記、同じ商品を何度もお気に入り登録できなくする
      t.index [:user_id, :item_id], unique: true
    end
  end
end
