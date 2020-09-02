Rails.application.routes.draw do

  root "boards#index"
  devise_for :users

  resources :boards do
     resources :lists
  end

  resources :list do
    resources :tasks
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
