class HomeController < ApplicationController
  def index
    if user_signed_in?
      gon.username = current_user.username
      gon.email = current_user.email
    end
    if Rails.env.development?
      gon.hostname = 'localhost:3000'
    else
      gon.hostname = request.host
    end
  end
end
