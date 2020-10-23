Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  # resources :portmanteaus
 # problem with resources above is the show action requires portmanteaus/id, which is plural!
  # ergo, customize it with portmanteau/:id
  resources :portmanteaus, except: [:show]
  #as is used for a link_to tag on index
  get 'portmanteau/:id', to: 'portmanteaus#show', as: 'portmanteau_show'
  
  # static pages
  # get 'pages/home'

  # url, controller#action'
  get 'about', to: 'pages#about'
  # get 'pages/contact'..orig, replaced by below so user doesn't requre added pages to view content
  get 'contact', to: 'pages#contact'
  get 'tech-news', to: 'pages#tech_news'
  # your can add any custom url
  get 'about-me', to: 'pages#about'

  resources :blogs do
    member do
      get :toggle_status
    end
  end
  #this is the home page of the application
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
