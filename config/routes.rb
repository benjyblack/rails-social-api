Rails.application.routes.draw do
  namespace :api do
    resources :users, only: [:create]

    post "users/:user_id/follow/:id", controller: "users", action: "follow"
    post "users/:user_id/unfollow/:id", controller: "users", action: "unfollow"
  end
end
