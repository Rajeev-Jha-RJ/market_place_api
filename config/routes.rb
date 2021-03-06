require 'api_constraints'

#comment for demo to sunil,jofy, vinayak

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  devise_for :users
  #Api definition
  namespace :api, defaults: { format: :json },
  								constraints: { subdomain: 'api' }, path: '/' do
  	scope module: :v1,
  								constraints: ApiConstraints.new(version: 1, default: true) do
  		# We are going to list our resources here
  		resources :users, :only => [:show, :create, :update, :destroy]
  	end
  end
end
