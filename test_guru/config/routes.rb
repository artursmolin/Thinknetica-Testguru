Rails.application.routes.draw do
  resources :tests do
    resources :questions, except: [:index], shallow: true do
      resources :answers, shallow: true
    end

    post :start, on: :member
  end

  resources :test_passages, only: %i[show update] do
      get :result, on: :member
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
