class CalendarController < ApplicationController
  def daily
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @prev_day = @date - 1.day
    @next_day = @date + 1.day
  end

  def weekly
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @prev_week = @date.beginning_of_week(:sunday) - 1.week
    @next_week = @date.beginning_of_week(:sunday) + 1.week
  end

  def monthly
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @prev_month = @date.prev_month
    @next_month = @date.next_month
  end
end
