class AddAvailableToTimeSlots < ActiveRecord::Migration[8.0]
  def change
    add_column :time_slots, :available, :boolean
  end
end
