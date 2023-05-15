Rails.application.routes.draw do
  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    unlocks: 'users/unlocks'
  }

  root to: "home#show"

  get 'about-us', to: 'home#about-us'

  resources :projects
  resource :volunteer

  namespace :manage do
    root :to => "dashboards#show"
    resource :dashboard
    resources :assignments, :only => [:index, :edit, :update, :show, :destroy] do
      resources :assignment_updates, :only => [:create, :destroy]
    end
    resources :projects do
      resources :assignments, :only => [:new, :create]
    end
    resources :volunteers
  end

  namespace :admin do
    root :to => "dashboards#show"
    resource :dashboard
    resources :projects
    resources :skills
    resources :products
    resources :users
    resources :volunteers
  end

end
