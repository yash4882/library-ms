Rails.application.routes.draw do
  get 'user/index'
  root "peoples#index"
  # get 'peoples/index'
  # get 'peoples/show'
  resources :peoples do 
    collection do
      get :person
      get :librarian
      get :student
    end
  end
end
