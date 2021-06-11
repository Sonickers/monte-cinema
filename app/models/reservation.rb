class Reservation < ApplicationRecord
  belongs_to :seance
  belongs_to :reservation_status
  belongs_to :ticket_desk

  has_many :tickets

  def expired?
    reservation_status == ReservationStatus.booked && seance.after_confirmation_deadline?
  end
end
