class RentalListsController < ApplicationController
	before_action :authenticate_user!

	# レンタル申請ボタンを押す際のアクション
	def create
		Payjp.api_key = 'sk_test_e9dd00f10b43ccea8d45dce8'
		# 下記、クレジットカード登録しているかのif文(subscription_idがnilかどうか)
		if current_user.subscription_id.nil?
			flash[:error] = 'クレジットカード情報を入力してください！'
			flash[:description] = '月額¥2,000-(税込)で年3本までレンタル頂けます。'
			return redirect_to new_home_path
		end

		@subscription = Payjp::Subscription.retrieve(current_user.subscription_id)

		# pay.jpにあるレコードがactiveかを判断する。
		return redirect_to home_path(current_user.id), error: '有効なカードでない可能性があります。別のカードを登録してください。' if @subscription.status != 'active'

		# フラッシュでレンタル本数の注意を書く
		return redirect_to root_path, danger: '3本以上レンタル中です。返却後、申請ください。' if current_user.rental_lists.count >= 3

		# レンタルリストに登録
		rental = RentalList.new(rentals_params)
		rental.user_id = current_user.id
		rental.save
		redirect_to thanks_items_path
	end

	def destroy
		@on_rentals = RentalList.find(params[:id])
		@on_rentals.destroy
		redirect_to root_path
	end

	private
	def rentals_params
		params.require(:rental_list).permit(:item_id)
	end

end
