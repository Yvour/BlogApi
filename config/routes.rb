Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :comments
  resources :posts
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #mount_devise_token_auth_for 'User', at: 'auth'
  root to: 'home#index'
  
   match 'api/v1/posts/json', to: 'posts#search_by_param', via: [:get], as: 'postsearch_by_param'
   match 'api/v1/posts/:post_id.json', to: 'posts#search_one', via: [:get], as: 'postsearch_by_id'
   match 'api/v1/posts.json', to: 'posts#search_by_page', via: [:get], as: 'postsearch_by_page'
end
