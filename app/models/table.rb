class Table < ApplicationRecord
  has_many :reservations
  has_many :time_slots, through: :time_slot_tables
  has_many :time_slot_tables, dependent: :destroy

  validates :available, presence: true
end
