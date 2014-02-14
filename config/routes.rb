Todo::Application.routes.draw do
  devise_for :users
  root 'pages#home'
  resources :tasks, except: [:index]
end
