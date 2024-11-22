class AddAvailableToTables < ActiveRecord::Migration[8.0]
  def change
    add_column :tables, :available, :boolean
  end
end
