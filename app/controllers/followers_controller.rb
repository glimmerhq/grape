class FollowersController < ApplicationController
  def show
    @user = User.find_by(username: params[:user])
  end
end
