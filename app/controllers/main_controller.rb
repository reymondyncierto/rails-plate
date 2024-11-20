class MainController < ApplicationController
  def index
    flash[:notice] = "Hello, Rails!"
    flash[:alert] = "Goodbye, Rails!"
  end
end
