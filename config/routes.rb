Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'sales' => 'goods#api_sales'
  get 'html_sales' => 'goods#html_sales'

  resources :goods do
    resources :days #, only: [:edit, :create]
  end
end
