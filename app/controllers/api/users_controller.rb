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

  def follow
    follower = User.find(params[:user_id])
    followee = User.find(params[:id])

    follower.follow(followee)

    # TODO: Add error checking

    render status: 200
  end

  def unfollow
    follower = User.find(params[:user_id])
    followee = User.find(params[:id])

    follower.unfollow(followee)

    # TODO: Add error checking

    render status: 200
  end
end
