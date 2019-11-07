Rails.application.routes.draw do
  resources :group_version_numbers
  resources :groups
  resources :user_matches
  resources :user_preferences
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
