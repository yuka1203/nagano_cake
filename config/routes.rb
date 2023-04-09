Rails.application.routes.draw do
    
    def after_sign_in_path_for(resource)
        admin_root_path
    end
    
    def after_sign_out_path_for(resource)
        admin_genres_path
    end
    
    # get '/about' => 'homes#about'
    
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
  
   get 'homes/top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
