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
    member do
      put "update_setting"
    end
  end
  resources :courtship_preferences
  resources :profiles, :path => "profile"
  resources :profile_photos do
    member do
      get "set-as-profile-picture" => "profile_photos#set_as_profile_picture"
    end
  end
  
  get 'mark_as_favorite/:to_user_id' => 'favourites#mark_as_favourite', as:'mark_as_favourite'
  get 'report_spam/:to_user_id' => 'user_actions#report_spam', as:'report_spam'
  get 'block/:to_user_id' => 'user_actions#block_user', as:'block_user'

  post 'contact', to: 'contacts#process_form'
  get 'myprofile'   => 'profiles#myprofile', as: 'myprofile'

  resources :conversations, except: [:index, :new, :create] do
    resources :messages
  end
  get '/sentbox' => 'conversations#sentbox'
  get '/inbox' => 'conversations#index'
  get '/trash' => 'conversations#trash'
  delete '/destroy_multiple_messages' => 'conversations#destroy_multiple_messages'
  # resources :messages, except: [:new, :create]
  # get ":id/set-as-favorite" => "taggable#set_as_favorite", as: :set_as_favorite
  mount Upmin::Engine => '/admin'
end
