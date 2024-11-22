class Reservation < ApplicationRecord
  belongs_to :time_slot
  belongs_to :table

  # Validations
  validates :guest_count, presence: true, numericality: { greater_than: 0 }
  validates :time_slot_id, presence: true, uniqueness: { scope: :table_id }
  validates :table_id, presence: true, uniqueness: { scope: :time_slot_id }

  validate :guest_count_within_table_capacity

  private

  # Custom validation to check if the guest count exceeds table capacity
  def guest_count_within_table_capacity
    if table && guest_count > table.capacity
      errors.add(:guest_count, "cannot exceed the table's capacity of #{table.capacity}")
    end
  end


end
