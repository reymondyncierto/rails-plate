Rails.application.routes.draw do
  root "main#index"

  get "about", to: "about#index"

  get "sign-up", to: "registrations#new"
  post "sign-up", to: "registrations#create"

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"

  delete "logout", to: "sessions#destroy"
end
