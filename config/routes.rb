Rails.application.routes.draw do
  devise_for :users

   root "books#top"

  get "users/:id" => "users#show", as: :mypage

  get "/home/about" => "books#about", as: :"home/about"

  resources :users

  resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
