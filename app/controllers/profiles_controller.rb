class ProfilesController < ApplicationController
  def show
    @user = User.find_by(username: params[:user])
  end
  def edit
  end
end
