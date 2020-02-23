Rails.application.routes.draw do

  post 'users/create' => 'users#create'
  post 'users/:id/update' => 'users#update'

  get 'users/:id/edit' => 'users#edit'
  get 'users/:id/destroy' => 'users#destroy'
  get 'signup' => 'users#new'
  get 'users/index' => 'users#index'
  get 'users/:id' => 'users#show'

  get 'posts/index' => 'posts#index'
  get 'posts/:id/edit' => 'posts#edit'
  get 'posts/new' => 'posts#new'
  get 'posts/:id' => 'posts#show'
  post 'posts/create' => 'posts#create'
  post 'posts/:id/update' => 'posts#update'
  post 'posts/:id/destroy' => 'posts#destroy'
  get '/'=> 'home#top'
  get 'about'=> 'home#about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end