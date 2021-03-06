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

  get "current_orders" => "users#current_orders"
  get "history_orders" => "users#history_orders"

  get "generated_orders" => "laundries#generated_orders"
   get "laundry_history_orders" => "laundries#laundry_history_orders"
  
  get 'profile' => "users#profile"
  get 'welcome/index'
  get '/contact', to: 'messages#new', as: 'contact'
  post '/contact', to: 'messages#create'
  #resources :garments do
  #  resources :services
  #end
  get 'deliver' => 'laundries#deliver'
  get 'send_order_mail', to: 'laundries#send_order_mail', as: :send_order_mail
  resources :orders
  
  resources :laundries do
    resources :garments do
      resources :services
    end
  end

  
  get '/laundry_admin/:id', to: 'laundries#laundry_admin', as: 'ladmin'
  get '/laundry_deliverers/:id', to: 'laundries#laundry_deliverers', as: 'ladeliverers'
  #get '/deliverers_laundry/:id', to: 'deliverers#index', as: 'ladeliverers'

  resources :laundries do
   resources :deliverers
    #get '/laundry_deliverers/:id', to: 'deliverers#index', as: 'ladeliverers'
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
    #get 'show_laundry'=>'laundries#show_laundry' 
  end


  devise_scope :user do
    get "sign_in" => "devise/sessions#new"
    get "sign_up" => "devise/registrations#new"
    
  end
  devise_for :users, controllers: { confirmations: 'confirmations', omniauth_callbacks: 'omniauth_callbacks', registrations:'registrations'}
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], as: :finish_signup  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
