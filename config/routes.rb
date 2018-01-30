Rails.application.routes.draw do
  get 'welcome/index', as: 'home'
  root 'welcome#index'

  resources :articles do
  	resources :comments
  end

  get "/404", :to => "errors#not_found"
  get "/422", :to => "errors#unacceptable"
  get "/404", :to => "errors#internal_error"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
