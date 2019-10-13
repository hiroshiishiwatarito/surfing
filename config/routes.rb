Rails.application.routes.draw do
  devise_for :tourists, controllers: {
    sessions:      'tourists/sessions',
    passwords:     'tourists/passwords',
    registrations: 'tourists/registrations'
  }

  devise_for :guiders, controllers: {
    sessions:      'guiders/sessions',
    passwords:     'guiders/passwords',
    registrations: 'guiders/registrations'
  }

  #本
  resources :plans
  root      'plans#top'
  get       'plans/:id/top' => "plans#top"
  post "plans/:id/purchase", to: "plans#purchase"
  get  "plans/:id/purchase" => "plans#purchase"
  get  "/plans" => "plans#destory"
  get  "plans/:id/fail"     => "plans#fail"

  #テスト
  resources :professions
  get '/professions/:id/category' => "professions#category"
  get '/professions/:id/top' => "professions#top"
  
  #カテゴリー
  resources :categorys
  get '/categorys' => 'categorys#index'

  #まとめサイト
  resources :tests
  get '/tests' => 'tests#index'
  get '/tests' => 'tests#new'
  get 'tests/:id' => 'tests#show'
  get '/tests/new/guideline' => 'tests#guideline'
  
  #ガイドナー
  resources :guiders
  get "/guiders/:id/post" => "guiders#post"
  get '/done' => 'guiders#done'
  get 'guiders/:id/go' => 'guiders#go'
  get "/guiders/:id/accepted" => "guiders#accepted"
  post "/guiders/:id/approve" => "guiders#approve_guider", as: "approve_guider"
  get  "/guiders/:id/approve" => "guiders#approve_guider"
 

  #観光客
  resources :tourists

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
