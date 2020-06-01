Rails.application.routes.draw do
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
  # your can add any custom url
  get 'about-me', to: 'pages#about'

  resources :blogs
  #this is the home page of the application
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
