class ItemsController < ApplicationController

	def index
		@items = Item.all
	end

	def about
	end

	def show
		flash[:danger] = '3本レンタル中です。返却後、申請ください。'
		flash[:sorry] = '現在レンタルを見合わせています。少々お待ちください。'
		flash[:bad] = '現在、レンタル見合わせ中。また、レンタル本数も3本借りています。'
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
