class CreateReservations < ActiveRecord::Migration[8.0]
  def change
    create_table :reservations do |t|
      t.references :time_slot, null: false, foreign_key: true
      t.references :table, null: false, foreign_key: true
      t.integer :guest_count

      t.timestamps
    end
  end
end
