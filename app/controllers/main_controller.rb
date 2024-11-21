class MainController < ApplicationController
  def index
    # flash[:notice] = "Hello, Rails!"
    # flash[:alert] = "Goodbye, Rails!"

    if session[:user_id]
      # If the user is logged in than find the user
      @user = User.find(session[:user_id])
    end

  end
end
