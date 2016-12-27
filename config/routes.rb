Rails.application.routes.draw do
  constraints Clearance::Constraints::SignedIn.new do
    root to: 'accounts#index'
    resources :accounts do
      resources :transactions, except: [:index]
    end
  end
end
