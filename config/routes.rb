Rails.application.routes.draw do
  resources :category_allocations
  resources :categories
  constraints Clearance::Constraints::SignedIn.new do
    root to: 'accounts#index'
    resources :accounts do
      resources :transactions, except: [:index]
    end
  end
end
