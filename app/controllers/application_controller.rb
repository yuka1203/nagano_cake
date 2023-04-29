class ApplicationController < ActionController::Base
      private
  
  
    # ログイン後のリダイレクト先
  def after_customer_sign_in_path_for(resource_or_scope)
    customers_mypage_path  #ここを好きなパスに変更
  end

  # ログアウト後のリダイレクト先
  def customer_sign_out_path_for(resource_or_scope)
    root_path #ここを好きなパスに変更
  end

  # ログイン後のリダイレクト先
  def after_admin_sign_in_path_for(resource_or_scope)
    admin_root_path  #ここを好きなパスに変更
  end

  # ログアウト後のリダイレクト先
  def after_sign_out_path_for(resource_or_scope)
    new_admin_session_path #ここを好きなパスに変更
  end
  
  # # ログイン後のリダイレクト先
  # def after_customer_sign_in_path_for(resource_or_scope)
  #   customers_mypage_path  #ここを好きなパスに変更
  # end

  # # ログアウト後のリダイレクト先
  # def customer_sign_out_path_for(resource_or_scope)
  #   root_path #ここを好きなパスに変更
  # end
  
end
