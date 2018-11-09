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
      resources :posts
    end
  end

end
