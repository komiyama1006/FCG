class Item < ApplicationRecord

	belongs_to :admin
	attachment :image

	belongs_to :genre
	validates :name, presence: :true

	has_many :favorites
	has_many :users, through: :favorites

	has_many :rental_lists
end
