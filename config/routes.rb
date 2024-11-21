Rails.application.routes.draw do
  root "main#index"

  get "about", to: "about#index"

  get "sign-up", to: "registrations#new"
  post "sign-up", to: "registrations#create"

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"

  get 'calendar/daily', to: 'calendar#daily', as: 'calendar_daily'
  get 'calendar/weekly', to: 'calendar#weekly', as: 'calendar_weekly'
  get 'calendar/monthly', to: 'calendar#monthly', as: 'calendar_monthly'

  delete "logout", to: "sessions#destroy"
end
