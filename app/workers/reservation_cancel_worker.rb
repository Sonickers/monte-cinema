class ReservationCancelWorker
  include Sidekiq::Worker

  def perform(reservation_id)
    reservation = Reservations::Repository.new.find(reservation_id)
    return unless reservation.expired?

    reservation.update!(reservation_status: ReservationStatus.cancelled)
  end
end
