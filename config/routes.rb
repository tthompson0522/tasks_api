Rails.application.routes.draw do
  get "/task_lists", to: "task_lists#index"
  get "/task_lists/new", to: "task_lists#new"
  post "/task_lists", to: "task_lists#create"
  get "/task_lists/:id", to: "task_lists#show"
  get "/task_lists/:id/edit", to: "task_lists#edit"
  patch "/task_lists/:id", to: "task_lists#update"
  put "/task_lists/:id", to: "task_lists#update"
  delete "/task_lists/:id", to: "task_lists#destroy"
  get "/task_lists/search/:name", to: "task_lists#search"
  resources :task_lists, shallow: true do
    get "/tasks", to: "tasks#index"
    get "/tasks/new", to: "tasks#new"
    post "/tasks", to: "tasks#create"
    get "/tasks/:id", to: "tasks#show"
    get "/tasks/:id/edit", to: "tasks#edit"
    patch "/tasks/:id", to: "tasks#update"
    put "/tasks/:id", to: "tasks#update"
  end
  delete "/tasks/:id", to: "tasks#destroy"
  get "/tasks/search/:description", to: "tasks#search"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
