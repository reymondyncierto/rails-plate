Rails.application.routes.draw do
  root "main#index"

  get "about", to: "about#index"
  get "sign-up", to: "registrations#new"

  post "sign-up", to: "registrations#create"
end
