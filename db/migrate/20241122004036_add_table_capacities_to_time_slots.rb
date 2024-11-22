class AddTableCapacitiesToTimeSlots < ActiveRecord::Migration[8.0]
  def change
    add_column :time_slots, :table_capacities, :text
  end
end
