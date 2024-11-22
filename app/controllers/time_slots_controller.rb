class TimeSlotsController < ApplicationController
  before_action :set_time_slot, only: [:edit, :update, :destroy, :add_table, :save_table]

  def index
    @time_slots = TimeSlot.includes(:tables).order(:start_time)
  end

  def new
    @time_slot = TimeSlot.new
    @time_slot.tables.build
  end

  def create
    @time_slot = TimeSlot.new(time_slot_params)
    @time_slot.available = true
    if @time_slot.save
      redirect_to manage_timeslots_path, notice: 'Time slot was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @time_slot.update(time_slot_params)
      redirect_to manage_timeslots_path, notice: 'Time slot was successfully updated.'
    else
      render :edit
    end
  end

  def show
    @time_slot = TimeSlot.find(params[:id])
  end

  def destroy
    @time_slot.destroy
    redirect_to manage_timeslots_path, notice: 'Time slot was successfully deleted.'
  end

  def add_table
    @table = @time_slot.tables.build
  end

  def save_table
    @table = @time_slot.tables.build(table_params)
    @table.available = true
    if @table.save
      # create a TimeSlotTable record to associate the table with the time slot
      @time_slot.tables << @table
      redirect_to manage_timeslots_path, notice: 'Table was successfully added.'
    else
      render :add_table
    end
  end

  private

  def set_time_slot
    @time_slot = TimeSlot.find(params[:id])
  end

  def time_slot_params
    params.require(:time_slot).permit(:date, :start_time, :end_time, :max_tables, tables_attributes: [:id, :capacity, :_destroy])
  end

  def table_params
    params.require(:table).permit(:capacity)
  end
end
