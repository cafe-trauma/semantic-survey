Rails.application.routes.draw do
  get "welcome/index"
  post "welcome/index", to: "welcome#register"
  root "welcome#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/questionnaire/:category", to: "category#show"
  resources :question
end
