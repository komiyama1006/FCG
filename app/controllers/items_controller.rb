class ItemsController < ApplicationController
	before_action :authenticate_user!, only: [:show, :thanks]
	PER = 6

	def index
		@items = Item.page(params[:page]).reverse_order
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

	def choise
	end

	private

	def favorites_params
		params.require(:favorite).permit(:item_id)
	end

end
