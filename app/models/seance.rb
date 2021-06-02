class Seance < ApplicationRecord
  belongs_to :hall
  belongs_to :movie
  has_many :reservations

  validates :movie_id, presence: true
  validates :hall_id, presence: true

  def available_seats
    hall.generate_seats - taken_seats
  end

  def taken_seats
    reservations.flat_map(&:tickets).map(&:seat)
  end
end
