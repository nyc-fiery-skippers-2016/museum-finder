Rails.application.routes.draw do

  # categories has an index of categories & a show with the list of museums within category
  get 'categories/home' => 'categories#home'

  resources :categories, only: [:index, :show]


  # museum has show page with museum info
  resources :museums, only: [:show]

  # create and destroy favorite
  # resources :favorites, only: [:create, :destroy]
  post '/favorite_museum' => 'favorites#create', as: :favorite
  delete '/unfavorite_museum' => 'favorites#destroy', as: :unfavorite
  # create route for search
  get 'search' => 'search#index', as: :search

  # devise takes care of users sessions and create


  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registration: 'users/registrations'
  }


  devise_scope :user do
    get '/user/sign_out', to: 'users/sessions#destroy'
  end

  resources :users, only: [:show]

  #welcome/root
  root :to => 'categories#home'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
