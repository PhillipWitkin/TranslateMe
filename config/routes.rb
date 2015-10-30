Rails.application.routes.draw do

  root 'welcome#index'
  # root 'welcome#phil_test'

  resources :users, only: [:new, :create]

  resource :login, only: [:new, :create, :destroy]
# API routes
  namespace :api do
  get '/cards/:card_id/card_translations' => 'translations#card_translations'
    resource :users , only: [:show] do
      resources :favorites, except: [:new,:update, :edit, :show]
      resources :translations, except: [:new, :edit, :show]
    end
    resources :cards, except: [:new, :edit] do
      resources :translations, except: [:new, :edit, :show]
    end
    resources :categories, only: [:index, :show]
    resources :tags, only: [:create, :destroy]
  end

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
