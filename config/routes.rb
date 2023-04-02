Rails.application.routes.draw do
  namespace :admin do
    get 'genres/index'
    post 'genres' => 'genres#create'
    get 'genres/edit'
  end
 namespace :admin do
    root to: "homes#top"
  end
  devise_for :admins, controllers: {
   sessions: 'admins/sessions',
   passwords: 'admins/passwords',
   registrations: 'admins/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
