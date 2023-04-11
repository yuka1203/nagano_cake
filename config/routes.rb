Rails.application.routes.draw do
    
  namespace :public do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
    get 'customers/confirm'
    get 'customers/withdrawal'
  end
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
    
    root to: 'homes#top'
    get '/about' => 'homes#about'
    resources :customers, only: [:show, :edit, :update, :confirm, :widthdrawal]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
