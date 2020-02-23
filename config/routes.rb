Rails.application.routes.draw do

  devise_for :admins, controllers:{
  sessions:      'admin/sessions',
  passwords:     'admin/passwords',
  registrations: 'admin/registrations'
  }

  devise_for :users, controllers: {
   sessions:      'users/sessions',
   passwords:     'users/passwords',
   registrations: 'users/registrations'
   }

  namespace :admin do
    get '/items/top' => 'items#top'

    resources :items
    resources :histories
    resources :genres, only: [:index, :create, :edit, :update]
    resources :users
  end

  resources :users do
    resources :favorites
  end

  resources :homes do
    collection do
      post :input
      post :subscription
    end
  end

  resources :items do
    collection do
      get :thanks
      get :about
      post :rental
    end
  end

  resources :rental_lists, only: [:create, :destroy]

  # localhost 3000のルーティング
  root to: 'items#top'

end
