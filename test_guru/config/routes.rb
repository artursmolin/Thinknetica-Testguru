Rails.application.routes.draw do

  resources :tests do
    resources :questions, shallow: true, only: [:index, :show, :create, :destroy, :new]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
