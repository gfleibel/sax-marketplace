Rails.application.routes.draw do
  devise_for :users
  root to: "saxophones#index"

  resources :saxophones do
    get :my_saxophones, on: :collection, as: "my"
    resources :orders, only: %i[new create]
  end

  get ":user_id/saxophones", to: "saxophones#user_saxophones", as: "user_saxophones"
  get ":user_id/orders", to: "orders#index", as: "user_orders"
  get ":user_id/sales", to: "orders#sales", as: "user_sales"
end
