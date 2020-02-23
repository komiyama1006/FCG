class Admin::ItemsController < ApplicationController
before_action :authenticate_admin!

	def index
		@frames = Item.all
		# @frames = Item.includes(:genre).where(genres:{is_valid: true}).all
	end

	def new
		@frame = Item.new
		@genres = Genre.all
	end

	def show
		@frame = Item.find(params[:id])
	end

	def edit
		@frame = Item.find(params[:id])
		@genres = Genre.all
	end

	def create
		@frame = Item.new(frame_params)
		# (画像投稿)adminのidを渡たさないといけない
		@frame.admin_id = current_admin.id
		@frame.save
		redirect_to admin_items_top_path
	end

	def update
		frame = Item.find(params[:id])
		frame.update(frame_params)
		redirect_to admin_items_top_path
	end

	def top
	end

	def destroy
		@frame = Item.find(params[:id])
		@frame.destroy
		redirect_to admin_items_top_path
	end

	private
	def frame_params
		params.require(:item).permit(:name, :color, :body, :image, :genre_id)
	end

end
