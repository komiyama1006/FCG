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
    resources :genres, only: [:index, :create, :edit, :update]
    resources :users
  end

  resources :users do
    resources :favorites, only: [:index, :create, :destroy]
  end

  resources :homes, only: [:new, :create, :destroy, :edit, :show, :update] do
    collection do
      get :withdraw
      post :subscription
    end
  end

  resources :items, only: [:index, :show] do
    collection do
      get :thanks
      get :about
      get :choise
      post :rental
    end
  end

  resources :rental_lists, only: [:create, :destroy]

  # localhost 3000のルーティング
  root to: 'items#top'

end
