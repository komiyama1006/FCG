class Admin::GenresController < ApplicationController
before_action :authenticate_admin!

	def index
		@genre = Genre.new
		@genres = Genre.where(is_valid: true)
	end

	def create
		genre = Genre.new(genre_params)
		if genre.save
			 redirect_to admin_genres_path
		else
			@genre = Genre.new
			@genres = Genre.all
			render :index
		end
	end

	def edit
		@genre = Genre.find(params[:id])
	end

	def update
		genre = Genre.find(params[:id])

		if params[:genre][:is_valid] == true
			 genre.is_valid = true
			 genre.update(genre_params)
			 redirect_to admin_genres_path
		else
			genre.is_valid = false
			genre.update(genre_params)
			redirect_to admin_genres_path
		end
	end

	private
	def genre_params
		params.require(:genre).permit(:name, :is_valid)
	end



end
