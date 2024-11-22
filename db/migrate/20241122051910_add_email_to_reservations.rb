class AddEmailToReservations < ActiveRecord::Migration[8.0]
  def change
    add_column :reservations, :email, :string
  end
end
