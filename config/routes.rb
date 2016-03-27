Rails.application.routes.draw do
  require 'sidekiq/web'

  mount Sidekiq::Web => '/sidekiq'
  root to: 'web/main#index'

  scope module: :web do
    resource :admin
  end

end
