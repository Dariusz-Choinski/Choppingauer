Rails.application.routes.draw do
  get '/scan/:barcode', to: 'scaner#scan'
  get '/exit', to: 'scaner#exit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
