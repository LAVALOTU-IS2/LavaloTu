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

  get 'static_pages/about'
  get 'static_pages/contact'
  get 'static_pages_about_path' => 'static_pages/about'
  get 'static_pages_contact_path' => 'static_pages/contact'
  get "prices" => "users#prices"
  get "orders" => "users#orders"
  get 'profile'=>"users#profile"
  get 'welcome/index'
  
  resources :garments do
    resources :services
  end

   resources :laundries do
    resources :services
  end

  scope 'User' do
    resources :users, only: [] do
      resources :places
    end
    resources :laundries
  end
  scope 'Admin' do
    resources :users do
      resources :places
    end
    resources :laundries
    resources :orders
    match '/users/:id/destroy', to: 'users#destroyUser',via: [:delete], as: 'destroy'
  end


  devise_scope :user do
    get "sign_in" => "devise/sessions#new"
    get "sign_up" => "devise/registrations#new"
    
  end
  devise_for :users, controllers: { confirmations: 'confirmations', omniauth_callbacks: 'omniauth_callbacks' }
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], as: :finish_signup  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  

end
