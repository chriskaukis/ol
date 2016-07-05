Rails.application.routes.draw do
  resources :businesses, only: [:index, :show]

  match '*path', to: 'application#raise_not_found', via: :any
end
