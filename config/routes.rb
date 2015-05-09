Rails.application.routes.draw do
  resources :list

  root "list#index"
end
