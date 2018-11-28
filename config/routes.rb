Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'api_sales' => 'sales#api_sales'
  get 'html_sales' => 'sales#html_sales'

  resources :good do 
    resource :days, only: [:create]
  end
end
