Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'sales' => 'sales#sales'
  get 'html_sales' => 'sales#html_sales'
end
