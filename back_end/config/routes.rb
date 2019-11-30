Rails.application.routes.draw do
  resources :user_profiles
  # resources :myprofiles
  resources :group_version_numbers
  resources :groups
  resources :user_matches
  resources :user_preferences
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :room_messages
  resources :rooms
  devise_for :users, controllers: { sessions: "users/sessions" }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # resources :myprofiles
  get "myprofile" => "yours#profile", :as => :myprofile

  root controller: :rooms, action: :index
end
