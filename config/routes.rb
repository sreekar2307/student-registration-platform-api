Rails.application.routes.draw do
  namespace :v1 do
    resources :students
    resources :degrees, only: [:index, :show] do
      resources :courses, only: [:index, :show]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
