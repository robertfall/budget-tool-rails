Rails.application.routes.draw do
  resources :accounts do
    resources :transactions, except: [:index]
  end
end
