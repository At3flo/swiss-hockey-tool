Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    as :user do
      post "/users", to: "registrations#create"
    end
    resources :teams_registrations, only: [:create, :destroy]
    resources :events, only: [:create, :edit, :update, :destroy]
    devise_for :users, controllers: {:registrations => "registrations"}
    root to: 'pages#home'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
end
