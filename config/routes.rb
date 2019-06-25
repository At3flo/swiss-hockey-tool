Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    resources :events, only: [:create, :edit, :update, :destroy]
    devise_for :users
    root to: 'pages#home'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
end
