Rails.application.routes.draw do
  root 'visitors#index'
  devise_for :users, :controllers => { registrations: 'registrations', sessions: 'sessions' }
  resources :users
  resources :courtship_preferences
  resources :profiles
  resources :profile_photos do
    member do
      get "set-as-profile-picture" => "profile_photos#set_as_profile_picture"
    end
  end
  post 'contact', to: 'contacts#process_form'
  get 'myprofile'   => 'profiles#myprofile', as: 'myprofile'
  get 'view-profile/:id'   => 'users#public_profile', as: 'public_profile'
  mount Upmin::Engine => '/admin'
end
