class Reservation < ApplicationRecord
  belongs_to :seance
  belongs_to :reservation_status
  belongs_to :ticket_desk
  belongs_to :user, optional: true

  has_many :tickets

  delegate :movie, to: :seance

  def expired?
    reservation_status == ReservationStatus.booked && seance.after_confirmation_deadline?
  end
end
