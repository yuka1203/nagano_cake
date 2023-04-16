Rails.application.routes.draw do
    
 
    # def after_sign_in_path_for(resource)
    #     admin_root_path
    # end
    
    # def after_sign_out_path_for(resource)
    #     admin_genres_path
    # end
    
    namespace :admin do
     root to: 'homes#top'
     resources :genres, only: [:new, :index, :create, :edit, :update]
     resources :items, only: [:new, :create, :index, :show, :edit, :update]
     resources :customers, only: [:index, :show, :edit, :update]
     resources :orders, only: [:show, :update]
    end
  
    devise_for :admin, controllers: {
    sessions: 'admin/sessions',
    passwords: 'admin/passwords',
    registrations: 'admin/registrations',
    confirmations: 'admin/confirmations'
    }
    
    devise_for :customers, controllers: {
    sessions: 'public/sessions',
    passwords: 'public/passwords',
    registrations: 'public/registrations',
    confirmations: 'public/confirmations'
    }
    
    scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about'
    resources :customers, only: [:show, :edit, :update]
    resources :items, only: [:show, :index]
    resources :addresses, only: [:create, :destroy, :edit, :index, :update]
    resources :cart_items, only: [:create, :index, :update, :destroy]
    resources :orders, only: [:new, :create, :index, :show]
    post '/orders/confirm' => 'orders#confirm'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
#   　get '/complete' => 'orders#complete'
  end
  
end
