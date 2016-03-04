Rails.application.routes.draw do
  root 'visitors#index'
  resources :profile_views
  resources :interests, only: [:index]
  devise_for :users, :controllers => { registrations: 'registrations', sessions: 'sessions' }
  resources :users do 
    resources :conversations, only: [:new, :create]
    collection do 
      get "search_users"
    end
  end
  resources :courtship_preferences
  resources :profiles
  resources :profile_photos do
    member do
      get "set-as-profile-picture" => "profile_photos#set_as_profile_picture"
    end
  end
  
  get 'mark_as_favorite/:to_user_id' => 'favourites#mark_as_favourite', as:'mark_as_favourite'

  post 'contact', to: 'contacts#process_form'
  get 'myprofile'   => 'profiles#myprofile', as: 'myprofile'

  resources :conversations, except: [:new, :create] do
    resources :messages
  end
  # resources :messages, except: [:new, :create]
  # get ":id/set-as-favorite" => "taggable#set_as_favorite", as: :set_as_favorite
  mount Upmin::Engine => '/admin'
end
