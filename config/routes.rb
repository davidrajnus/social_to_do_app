Rails.application.routes.draw do
  get 'tasks/index'

  get 'tasks/new'

  get 'tasks/show'

  get 'tasks/edit'

  get 'tasks/update'

  get 'tasks/destroy'

  get 'sessions/new'

  get 'users/new'

  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  
  resources :users

  resources :users do 
    resources :tasks
  end
end
