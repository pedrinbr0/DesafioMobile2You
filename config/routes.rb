Rails.application.routes.draw do
  resources :movies, only: [:index] do
    collection do
      post :import
    end
  end
end
