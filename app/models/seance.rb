class Seance < ApplicationRecord
  belongs_to :hall
  belongs_to :movie
  has_many :reservations

  validates :movie_id, presence: true
  validates :hall_id, presence: true

  def available_seats
    all_seats = hall.generate_seats
    taken = taken_seats

    all_seats.reject { |seat| taken.include? seat }
  end

  def taken_seats
    reserved_tickets = reservations.map(&:tickets).flatten

    reserved_tickets.map(&:seat)
  end
end
