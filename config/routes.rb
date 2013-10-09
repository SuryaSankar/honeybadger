Honeybadger::Application.routes.draw do
  get "search_results_controller/search"
  root 'pages#home'


  devise_scope :user do
	post "/users" => "users/registrations#append_or_create" , as: "user_registration"
  end
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  devise_for :admins, controllers: { sessions: "admins/sessions" }

  get "home_programs_json" => 'programs#json_list'

  get "pages/about"
  get "pages/channel"
  get '/search/find_courses_from_program_and_semester' => 'search_results#find_courses_from_program_and_semester'
  get '/search/find_programs_from_university_and_branch' => 'search_results#find_programs_from_university_and_branch'
  get '/search/get_course' => 'search_results#get_course'
  get '/university_courses/:id/new_qpaper' => 'university_courses#new_qpaper' , as: "university_courses_new_qpaper"
  

  resources :qpapers
  resources :questions
  resources :courses
  resources :examquestions
  resources :branches
  resources :universities
  resources :programs
  resources :institutions
  resources :university_courses
  resources :solutions
  resources :wikis
  resources :notes
  resources :units
  resources :program_university_courses



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
