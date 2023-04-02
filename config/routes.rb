Rails.application.routes.draw do
    
    namespace :admin do
     root to: 'homes#top'
     resources :genres, only: [:new, :index, :create, :edit, :update]
    end
  
    devise_for :admin, controllers: {
    sessions: 'admin/sessions',
    passwords: 'admin/passwords',
    registrations: 'admin/registrations',
    confirmations: 'admin/confirmations'
    }
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
