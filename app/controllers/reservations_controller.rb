class ReservationsController < ApplicationController
  before_action :set_time_slot, only: [:new, :create]
  before_action :set_date, only: [:new, :form]
  before_action :set_reservation, only: [:cancel]

  def index
    if Current.user.admin?
      @reservations = Reservation.all # Admin can view all reservations
    else
      @reservations = Reservation.where(email: Current.user.email)
    end
  end

  def confirm
    if Current.user.admin? && @reservation.status == 'pending'
      @reservation.update(status: 'confirmed')
      redirect_to reservations_path, notice: 'Reservation was successfully confirmed.'
    else
      redirect_to reservations_path, alert: 'You are not authorized to confirm this reservation.'
    end
  end

  def cancel
    if @reservation.destroy
    redirect_to reservations_path, notice: 'Reservation was successfully canceled.'
    else
      redirect_to reservations_path, alert: 'Failed to cancel reservation.'
    end
  end


  def new
    @time_slot = TimeSlot.find(params[:time_slot_id])
    @reservation = Reservation.new
    @tables = @time_slot.tables
  end

  def form
    @time_slot = TimeSlot.find(params[:time_slot_id])
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.status = :pending
    if @reservation.save
      redirect_to root_path, notice: 'Reservation was successfully created.'
    else
      redirect_to root_path, alert: @reservation.errors.full_messages.to_sentence
    end
  end

  def confirm
    @time_slot = TimeSlot.find(params[:time_slot_id])
    @reservation = Reservation.new(reservation_params)
    @tables = @time_slot.tables
    @selected_table = @tables.find { |table| table.id == params[:reservation][:table_id].to_i }

    # Display confirmation page with all reservation details
  end


  private

  def set_date
    # Default to current date, or use the date from params
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

  def set_time_slot
    # @time_slot = TimeSlot.find(params[:time_slot_id])
  end

  def set_reservation
    @reservation = Reservation.find_by(id: params[:id])
    redirect_to reservations_path, alert: 'Reservation not found.' if @reservation.nil?
  end

  def reservation_params
    params.require(:reservation).permit(:name, :email, :user_name, :time_slot_id, :guest_count, :table_id)
  end
end
