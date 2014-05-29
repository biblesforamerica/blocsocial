Rails.application.routes.draw do


  get 'bookmarks/index'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root to: 'welcome#index'

  post :incoming, to: 'incoming#create'

  resources :bookmarks, only: [:index, :destroy]
  resources :likes, only: [:index]


#   devise_scope :user do
#     get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
#   end
end
