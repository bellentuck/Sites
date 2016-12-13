Rails.application.routes.draw do

  # root route #
  root :to => 'public#index'
  get 'watch/:permalink', :to => 'public#show', :as => 'public_show'

  get 'admin', :to => 'access#menu'
  get 'access/menu'
  get 'access/login'
  post 'access/attempt_login'
  get 'access/logout'

  resources :admin_users, :except => [:show] do
      member do
        get :delete  #could also put 'post'
      end
    end

  resources :scholars do
    member do
      get :delete  #could also put 'post'
    end
  end

  resources :videos do
    member do
      get :delete  #could also put 'post'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
