class FollowersController < ApplicationController
  def show
    @user = User.find_by(username: params[:user])

    @user_props = { name: @user.nickname || @user.username.capitalize }
  end
end
