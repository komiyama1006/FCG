class ItemsController < ApplicationController

	def index
		@items = Item.all
	end

	def about
	end

	def show
		@frame = Item.where(id: params[:id])
		@item = Item.find(params[:id])

		@favorite = Favorite.new

		@rental = RentalList.new
		@likes = RentalList.all

	end

	def top
	end

	def thanks
	end

	private

	def favorites_params
		params.require(:favorite).permit(:item_id)
	end

end
