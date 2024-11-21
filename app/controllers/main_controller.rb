class MainController < ApplicationController
  def index
    redirect_to calendar_monthly_path(date: Date.today)
  end
end
