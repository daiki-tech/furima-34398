Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items, only:[:new, :create, :edit, :update, :destroy, :show, :index] do
  end
  resources :users, only:[:show]
end
