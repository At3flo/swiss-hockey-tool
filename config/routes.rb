Rails.application.routes.draw do
  get 'events/new'
  get 'events/create'
  get 'categories/new'
  get 'categories/create'
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    resources :events, only: [:new, :create]
    devise_for :users
    root to: 'pages#home'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
end
