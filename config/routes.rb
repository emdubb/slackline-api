Rails.application.routes.draw do
  root 'api#index'

  namespace :api do
    resources :users, only: [:index, :create, :show, :update, :destroy], shallow: true do
      resources :lines, only: [:index, :create, :update, :destroy], shallow: true do
        resources :posts, only: [:index, :create, :show, :update], shallow: true do
          resources :comments, only: [:index, :create, :update, :destroy]
        end
      end
    end

    get 'me', to: 'users#me'
    post 'token', to: 'users#token'
  end
end
