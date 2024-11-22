class CreateTimeSlotTables < ActiveRecord::Migration[8.0]
  def change
    create_table :time_slot_tables do |t|
      t.references :time_slot, null: false, foreign_key: true
      t.references :table, null: false, foreign_key: true

      t.timestamps
    end
  end
end
