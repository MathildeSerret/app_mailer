class Event < ApplicationRecord
has_many :attendance
has_many :users, through: :attendance 

	validates :start_date, presence: true
	
def start_date_cannot_be_in_the_past
    if !start_date.blank? and expiration_date < Date.today
      errors.add(:start_date, "can't be in the past")
    end
  end

	validates :duration, presence: true, numericality: { greater_than: 0 }
	validates :title, presence: true, length: { in: 5..140 }
	validates :description, presence: true, length: { in: 20..1000 }
	validates :price, presence: true, length: { in: 1..1000 }
	validates :location, presence: true
end
