Rails.application.routes.draw do
  root to: 'landscaping_services#index' # this will configure server to bring up index page when connecting to root path

  resources :seniors
  resources :students
  resources :landscaping_services
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
