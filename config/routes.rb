Rails.application.routes.draw do
  resources :portmanteaus
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
