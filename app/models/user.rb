class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :items
  has_many :favorites, dependent: :destroy
  has_many :rental_lists, dependent: :destroy
  # 下記、fav_items(テーブル)などないので、sourceでどのテーブルを参照するか指定している
  has_many :fav_items, through: :favorites, source: :item

  # ユーザーがお気に入りにする商品
  def anxious(item)
  	favorites.find_or_create_by(item_id: item.id)
  end

  # ユーザーがお気に入りを削除する機能
  def unanxious(item)
  	favorite = favorites.find_by(item_id: item.id)
  	favorite.destroy if favorite
  end

end
