Rails.application.routes.draw do
  

  mount Ckeditor::Engine => '/ckeditor'
  root to: "posts#index"

  resources :posts
  resources :tags, only: [:index, :show]
  get '/sports', to: 'tags#show'


end
