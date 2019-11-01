Rails.application.routes.draw do
  get 'register', to: 'authentication#register'
  get 'register-hobby', to: 'authentication#register_hobby'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'
end
