Rails.application.routes.draw do


  root 'pages#home' # syntax is controller#action

  devise_for 	:users,
  				:path => '',
  				:path_names => {:sign_in => 'login', :sign_out => 'logout', :edit => 'profile'},
  				:controllers => {:omniauth_callbacks => 'omniauth_callbacks',
                    :registrations => 'registrations'
                    }
  
  resources :users, only: [:show]
  resources :items
  resources :photos
  resources :reservations, only: [:destroy]
  resources :charges
    
  resources :items do
     resources :reservations, only: [:create, :destroy] 
  end
    
  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end
    
  resources :items do 
    resources :reviews, only: [:create, :destroy]
  end      

  get '/preload' => 'reservations#preload'
  get '/preview' => 'reservations#preview'
  
  get 'items/new', as: 'new_items_path'
  get 'subcategories/update_subcategories', as: 'update_subcategories'
  get 'subcategories/show'
    
  get '/your_rental_history' => 'reservations#your_rental_history'
  get '/your_reservations' => 'reservations#your_reservations'
    
  post '/notify' => 'reservations#notify'
  post '/your_rental_history' => 'reservations#your_rental_history'
    
  get '/search' => 'pages#search'
    
  get '/waiver' => 'pages#waiver'
  get '/about' => 'pages#about'
  get '/fees' => 'pages#fees'
  get '/blog' => 'pages#blog'    
    
end
