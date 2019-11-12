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
    followee = User.find(params[:id])

    user.follow(followee)

    render status: 200
  rescue StandardError => e
    # TODO: log error
    render status: 422
  end

  def unfollow
    followee = User.find(params[:id])

    user.unfollow(followee)

    render status: 200
  rescue StandardError => e
    # TODO: log error
    render status: 422
  end

  def followers
    render status: 200, json: user.followers
  end

  private

  def user
    @user ||= User.find(params[:user_id])
  end
end
