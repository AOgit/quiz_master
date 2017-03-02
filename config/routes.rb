Rails.application.routes.draw do

  root 'quizzes#index'

  # get 'questions/show'

  # get 'questions/update'

  # get 'quizzes/process' => 'quizzes#game_logic'

  get 'quizzes/new' => 'quizzes#new'

  post 'quizzes/question' => 'quizzes#create_query'

  get 'quizzes/identification' => 'quizzes#identify'

  post 'quizzes/post_answer_id' => 'quizzes#post_answer_id'

  get 'quizzes/multiple_choice' => 'quizzes#multiple_choice'

  post 'quizzes/post_answer_mc' => 'quizzes#post_answer_mc'

  get 'quizzes/true_false' => 'quizzes#true_false'

  post 'quizzes/post_answer_tf' => 'quizzes#post_answer_tf'

  get 'quizzes/begin' => 'quizzes#begin'

  get 'quizzes/give_ans' => 'quizzes#process_answer'

  get 'quizzes/get_next' => 'quizzes#next_question'

  get 'quizzes/reset' => 'quizzes#reset'

  get 'questions/ans_key' => 'questions#ans_key'

  get 'questions/:id' => 'questions#show'

  get 'questions/:id/edit' => 'questions#edit'

  patch 'questions/:id' => 'questions#update'

  delete 'questions/:id' => 'questions#destroy'

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
