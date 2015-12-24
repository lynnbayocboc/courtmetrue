Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations', sessions: 'sessions' }

  resources :users
  resources :courtship_preferences
  resources :profiles
  
  root 'visitors#index'

  post 'contact', to: 'contacts#process_form'
  get 'myprofile'   => 'profiles#myprofile', as: 'myprofile'
  
  mount Upmin::Engine => '/admin'
end
