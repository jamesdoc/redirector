REDIRECT_HOSTS = ['redirect.dv', 'google.com']

Rails.application.routes.draw do

  constraints(host: Regexp.new(REDIRECT_HOSTS.join('|'))) do
    get "*path", to: "redirects#index"
  end

  # TODO: change this to a 301
  root to: redirect('/dashboard', status: 302)

  devise_for :users

  get "dashboard", to: "dashboards#index"
  get "config", to: "config#index"

  # get "user", to: "users#index"
  # delete "user/:id", to: "users#destroy"
  resources :users, :only => [:destroy]
  # resources :users

  resources :links, :except => [:index, :new]
  get "links", to: redirect('/dashboard'), status: 301

end
