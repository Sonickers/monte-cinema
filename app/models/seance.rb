class Seance < ApplicationRecord
  belongs_to :hall
  belongs_to :movie
  has_many :reservations

  validates :movie_id, presence: true
  validates :hall_id, presence: true

  def confirmation_deadline
    datetime - 30.minutes
  end

  def after_confirmation_deadline?
    Time.current.after?(confirmation_deadline)
  end
end
