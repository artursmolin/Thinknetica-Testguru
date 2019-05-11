Rails.application.routes.draw do


  resources :tests  do
    resources :questions, except: [:index], shallow: true do
      resources :answers, shallow: true
    end

    member do
      post :start
    end
  end

  resources :test_passages, only: [:show, :update] do
    member do
      get :result
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
