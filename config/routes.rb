Rails.application.routes.draw do
  
  
  
  mount Ckeditor::Engine => '/ckeditor'
  mount Wirispluginengine::Engine => 'wirispluginengine'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # authenticated :researcher do
  #   root :to => 'researcher#index', as: :authenticated_root
  # end
  resources :xopus_pdfs do
    post :create_xml_temp, on: :collection
  end

  get 'category/index'

  as :researcher do   
    root :to => 'home#index'
    get 'home/get_xopus/:id' =>'home#get_xopus'
    get 'papers/:id' =>'home#show'
    get 'home/index'
    get 'search', :to => 'search#new',:as => 'search'
    get 'search/results', :to => 'search#show',:as => 'search_res'
    get 'home/about', :as =>"about"
    get 'researchers/note'
    get 'home/contact_us', :as =>"contact"
    get 'paper/:id/like' => "home#like_it", :as => 'like_paper'
    devise_for :researchers, controllers: { sessions: 'researchers/sessions', registrations: 'researchers',confirmations: 'researchers/confirmations' }#, passwords: 'researchers/passwords', omniauth_callbacks: 'researchers/omniauth_callbacks' }
  end
   
  as :researcher do        
     resources :researchers do
      resources :papers
     end
  end

resources :papers, only: [:show] do
  get '/download/:paper_id' =>'papers#download', :as => 'download'  
  resources :comments
end
get '/tags/:tag' => 'papers#find_by_tag', :as => "tag"

resources :papers, only: [:index]
resources :post_attachments

get 'papers/:category_name',:to => 'papers#index'
resources :categories 
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
