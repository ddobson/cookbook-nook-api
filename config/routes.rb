# frozen_string_literal: true
Rails.application.routes.draw do
  resources :cookbooks, except: [:new, :edit] do
    resources :recipes, only: [:index, :create]
  end
  resources :recipes, only: [:show, :update, :destroy]
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out/:id' => 'users#signout'
  patch '/change-password/:id' => 'users#changepw'
  resources :users, only: [:index, :show]
  get '/validate-user' => 'users#validate_user'
end
