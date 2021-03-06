Blog::Application.routes.draw do

  namespace :admin do
    root :to => "admin#index"
    
    resources :posts
    resources :authors
  end

  match "/about" => "pages#about", :as => :about

  resources :posts do
    get 'page/:page', :action => :index, :on => :collection
  end

  # authors
  match '/authors' => 'authors#index'
  match "/authors/:id" => "authors#show", :as => :author

  # sections
  match '/sections' => 'sections#index'
  match '/sections/:id' => 'sections#show', :as => :section

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "sections#index"

  match "page/:page" => "posts#index"

  # See how all your routes lay out with "rake routes"
end
