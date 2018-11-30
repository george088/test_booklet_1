Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  get 'user_token' => 'user_token#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'sales' => 'goods#api_sales'
  get 'html_sales' => 'goods#html_sales'

  resources :goods do
    resources :days #, only: [:edit, :create]
  end

  resources :api_goods
end
