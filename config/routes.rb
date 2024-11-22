Rails.application.routes.draw do
  root "main#index"

  get "about", to: "about#index"

  get "sign-up", to: "registrations#new"
  post "sign-up", to: "registrations#create"

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"

  get 'calendar', to: 'calendar#index', as: 'calendar'
  get 'calendar/daily', to: 'calendar#daily', as: 'calendar_daily'
  get 'calendar/weekly', to: 'calendar#weekly', as: 'calendar_weekly'
  get 'calendar/monthly', to: 'calendar#monthly', as: 'calendar_monthly'

  get 'manage_reservations', to: 'reservations#manage', as: 'manage_reservations'
  get 'manage_timeslots', to: 'time_slots#index', as: 'manage_timeslots'

  resources :reservations, only: [:index, :new, :create, :index]
  resources :time_slots do
    member do
      get 'add_table', to: 'time_slots#add_table'
      post 'add_table', to: 'time_slots#save_table'
    end
  end
  resources :time_slots do
    resources :reservations, only: [:new, :create]
  end
  resources :time_slots, only: [:index, :show] do
    member do
      get 'make_reservation'  # This route will be used to show the reservation form
    end
  end

  resources :reservations do
    member do
      delete :cancel  # This route will map to the cancel method
    end
  end


  get "reservations/form", to: "reservations#form", as: "reservation_form"

  resources :reservations do
    member do
      post :confirm
    end
  end

  resources :reservations do
    member do
      patch 'confirm'  # Define the patch route for confirming reservations
    end
  end


  delete "logout", to: "sessions#destroy"
end
