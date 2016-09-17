Rails.application.routes.draw do
  #get 'services/new'

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
        resources :users, :only => [:show, :index]
        resources :garments, :only => [:show, :index]
    end
  end


	get 'static_pages/about'
	get 'static_pages/contact'
	get 'static_pages_about_path' => 'static_pages/about'
	get 'static_pages_contact_path' => 'static_pages/contact'

  resources :garments do
    resources :services
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'welcome/index'
  root "welcome#index"
  devise_scope :user do
  	get "sign_in" => "devise/sessions#new"
  	get "sign_up" => "devise/registrations#new"
  end
  
	devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], as: :finish_signup  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
