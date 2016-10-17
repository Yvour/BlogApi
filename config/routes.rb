Rails.application.routes.draw do
  resources :comments
  resources :posts
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  
   match 'api/v1/posts/json', to: 'posts#search', via: [:post], as: 'postsearch_by_param'
   match 'api/v1/posts/:post_id.json', to: 'posts#search', via: [:get], as: 'postsearch_by_id'
   match 'api/v1/posts.json', to: 'posts#search_by_page', via: [:get], as: 'postsearch_by_page'
end
