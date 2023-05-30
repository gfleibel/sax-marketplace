Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :saxophones do
    get :my_saxophones, on: :collection, as: "my"
  end

  get ":user_id/saxophones", to: "saxophones#user_saxophones", as: "user_saxophones"
end
