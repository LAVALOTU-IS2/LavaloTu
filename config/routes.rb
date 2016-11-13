Rails.application.routes.draw do
  
  root "welcome#index"

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
        resources :users, :only => [:show, :index, :create, :update, :destroy] do
          collection do
            post 'login', to: :login
            post 'reloadUser', to: :reloadUser 
          end
        end
        resources :garments, :only => [:show, :index, :create, :update, :destroy]
        resources :laundries, :only => [:show, :index, :create, :update, :destroy]
        resources :services, :only => [:show, :index, :create, :update, :destroy]
    end
  end

  get '/about', to: 'static_pages#about', as: 'about'
  get '/not_authorized', to: 'static_pages#not_authorized', as: 'not_authorized'
  get "prices"      =>  "users#prices"
  get "orders"      =>  "users#orders"

  get "pre_orders"  =>  "users#pre_orders"
  get "current_orders" => "users#current_orders"
  get "history_orders" => "users#history_orders"
  
  get 'profile' => "users#profile"
  get 'welcome/index'
  get '/contact', to: 'messages#new', as: 'contact'
  post '/contact', to: 'messages#create'
  #resources :garments do
  #  resources :services
  #end

  resources :laundries do
    resources :garments do
      resources :services
    end
  end

  scope 'Laundry' do
    get '/laundry_admin/:id', to: 'laundries#laundry_admin', as: 'ladmin'
  end
  scope 'User' do
  resources :users do
      resources :places
    end
    resources :laundries

  end
  resource :user, only: [:edit, :update] do
  collection do
    patch 'update_password'
  end
end
  scope 'Admin' do
    resources :users do
      resources :places
    end
    match '/users/:id/destroy', to: 'users#destroyUser',via: [:delete], as: 'destroy'
    resources :laundries
    resources :orders
    #get 'show_laundry'=>'laundries#show_laundry'

  end


  devise_scope :user do
    get "sign_in" => "devise/sessions#new"
    get "sign_up" => "devise/registrations#new"
    
  end
  devise_for :users, controllers: { confirmations: 'confirmations', omniauth_callbacks: 'omniauth_callbacks', registrations:'registrations'}
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], as: :finish_signup  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
