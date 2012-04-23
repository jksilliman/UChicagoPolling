Otis::Application.routes.draw do
  resources :polls do
    resource :response
  end
  resources :surveys, :only => [:index, :show, :update]


  resource :info, :controller => "info", :only => [:edit, :update]
  

  namespace :admin do
    resources :users, :only => [:index, :new, :create, :destroy]
    resources :content, :only => [:index, :edit, :update]
    resources :surveys do
      resources :pages
      resources :questions
    end


    root :to => 'surveys#index', :as => ""
  end



  devise_for :users, :controllers => { :sessions => "users/sessions" }
  root :to => "surveys#index"
end
