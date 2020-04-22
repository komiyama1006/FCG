class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  # 全てのコントローラーは、aplicationcotrollerを継承してから動いている

	def after_sign_in_path_for(resource)
  	if admin_signed_in?
      admin_items_top_path
    else
      root_path
    end
  end

  def after_sign_up_path_for(resource)
   	if admin_signed_up?
   	 	admin_top_path
   	else
   	  root_path
   	end
  end

  # 下記、検索機能
  def set_search
    @search = Item.ransack(params[:q])
    @search_items = @search.result.page(params[:page])
  end

  #下記、新規登録の情報を顧客データとして登録と保存を同時に行っている。
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :first_name, :family_name, :first_name_kana, :family_name_kana, :email, :address, :tel, :post_number])
  end

end
