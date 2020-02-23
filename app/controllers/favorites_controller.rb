class FavoritesController < ApplicationController
	before_action :authenticate_user!

	def index
		@favorites = Favorite.all
	end

	def destroy
		@favorites = Favorite.find(params[:id])
		@favorites.destroy
		redirect_to root_path
	end

	def create
		favorite = Favorite.new(favorites_params)
		favorite.user_id = current_user.id
		favorite.save
		redirect_to items_path
	end

	private
	def favorites_params
		params.require(:favorite).permit(:item_id)
	end

end
