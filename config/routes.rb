Rails.application.routes.draw do
  resources :profile_views
  root 'visitors#index'
  devise_for :users, :controllers => { registrations: 'registrations', sessions: 'sessions' }
  resources :users do 
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
  get 'view-profile/:id'   => 'users#public_profile', as: 'public_profile'
  # get ":id/set-as-favorite" => "taggable#set_as_favorite", as: :set_as_favorite
  mount Upmin::Engine => '/admin'
end
