Rails.application.routes.draw do
 resources :posts, expect: [:show]

 get 'about' => 'welcome#about'

  root to: 'welcome#index'
end