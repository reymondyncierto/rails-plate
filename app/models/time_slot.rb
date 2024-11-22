class TimeSlot < ApplicationRecord
  has_many :time_slot_tables, dependent: :destroy
  has_many :tables, through: :time_slot_tables
  has_many :reservations

  accepts_nested_attributes_for :tables, allow_destroy: true

  validates :max_tables, numericality: { greater_than_or_equal_to: 1, only_integer: true }

  validates :available, presence: true

  # Check if a timeslot is available (i.e., not all tables are reserved)
  def available?
    reservations.count < max_tables
  end
end
