class Api::UsersController < ApplicationController
  def create
    user = User.create(
      username: params[:username],
      name: params[:name],
    )

    if user.present?
      render status: 200, json: user
    else
      render status: 422
    end
  end
end
