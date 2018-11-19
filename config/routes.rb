Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  get '/', to: redirect('/api-docs')

  namespace :api, { format: :json } do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks]
      post 'auth/request', to:'authorization#get_authorization'
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
