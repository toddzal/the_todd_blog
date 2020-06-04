Rails.application.routes.draw do
  get 'article_top/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'articles#index'
  resources :articles do
    resources :comments
  end
  resources :tags
  resources :authors
  resources :author_sessions, only: [ :new, :create, :destroy ]
  resources :article_top

  get 'login'  => 'author_sessions#new'
  get 'logout' => 'author_sessions#destroy'

end
