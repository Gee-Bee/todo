Todo::Application.routes.draw do
  root 'pages#home'
  resources :tasks, except: [:index]
end
