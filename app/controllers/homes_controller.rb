class HomesController < ApplicationController
	protect_from_forgery except: :set_search
	require 'payjp'

def top
end

def new
end

def create
	Payjp.api_key = 'sk_test_e9dd00f10b43ccea8d45dce8'
	response = Payjp::Token.create({
	  	:card => {
	    :number => params[:number],
	    :cvc => params[:cvc],
	    :exp_month => params[:exp_month],
	    :exp_year => params[:exp_year]
	  }},
	  {
	    'X-Payjp-Direct-Token-Generate': 'true'
	  }
	)

	# 下記、定期課金プランの作成
	rental_plan = Payjp::Plan.create(
	  amount: 2000,
	  currency: 'jpy',
	  interval: 'month',
	  trial_days: 0
	)


	# 下記、顧客を登録
	customer = Payjp::Customer.create(
		# description: 'test',
	  description: current_user.name,
	  email: current_user.email,
	  card: response
	)

	current_user.pay_customer_id = customer.id

	current_user.rental_plan = rental_plan.id

	current_user.card_information = response['id']


	# 下記、定期課金
	@subscription = Payjp::Subscription.create(
	  plan: current_user.rental_plan,
	  customer: current_user.pay_customer_id
	)

	current_user.subscription_id = @subscription.id

	current_user.save

	# pay.jpにあるレコードがactiveかを判断する。
	if  @subscription.status == 'active'
		redirect_to home_path(current_user.id)
		# 成功した場合
	else
		# 失敗した場合

	end

end

def show
	# 下記、ユーザーの登録情報を見つける
	@user = User.find(current_user.id)
	@on_rentals = RentalList.all
end

def edit
	@user = current_user
end

def update
	user = User.find(current_user.id)
	user.update(user_params)
	redirect_to home_path
end

def destroy
    @customer = current_user
    @customer.destroy
    redirect_to root_path
end

def withdraw
end

private
 def user_params
 	params.require(:user).permit(:first_name, :family_name, :first_name_kana, :family_name_kana, :email, :address, :tel, :post_number)
 end
end