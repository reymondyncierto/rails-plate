class MainController < ApplicationController
  def index
    if Current.user
      @date = params[:date] ? Date.parse(params[:date]) : Date.today
      @time_slots = TimeSlot.where(start_time: @date.beginning_of_month..@date.end_of_month)
      render 'index'
    else
      redirect_to calendar_monthly_path(date: Date.today)
    end
  end
end
