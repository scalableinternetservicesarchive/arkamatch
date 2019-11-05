Rails.application.routes.draw do
  get 'static_pages/home'
  get 'static_pages/help'
  get 'hello_world', to: 'hello_world#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   root to: 'pages#home'
end
