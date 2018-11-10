Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  get '/', to: redirect('/api-docs')
  
  devise_for :users

  namespace :api, { format: :json } do
    namespace :v1 do
      namespace :admin do
        resources :categories
      end
      resources :posts do
        resources :comments, except: %w(show update destroy)
        resources :likes, only: %w(index create)
      end
      resources :comments, only: %w(update destroy) do
        resources :replies, except: %w(show update destroy)
      end
      resources :replies, only: %w(update destroy)
      resources :likes, only: %w(destroy)
    end
  end
end
