Rails.application.routes.draw do
  root 'pages#home'  
  get '/', to: 'pages#home'
  
  resources :recipes
  
end
