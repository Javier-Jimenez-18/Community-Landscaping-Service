Rails.application.routes.draw do
  # this will configure server to bring up index page when connecting to root path
  root to: 'home#index'
  resources :my_dates
  resources :seniors
  resources :students
  resources :landscaping_services
  devise_for :users
  get '/home/index'
  get '/flatpickr_edit/:id', to: 'my_dates#flatpickr_edit', as: 'flatpickr_edit'
  get '/flatpickr_new', to: 'my_dates#flatpickr_new', as: 'flatpickr_new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
