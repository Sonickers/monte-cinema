class ReservationCancelWorker
  include Sidekiq::Worker

  def perform(reservation_id)
    reservation = Reservations::Repository.new.find(reservation_id)
    return unless reservation.expired?

    reservation.update!(reservation_status: ReservationStatus.cancelled)
    send_cancelled_mail(reservation) if reservation.user
  end

  private

  def send_cancelled_mail(reservation)
    ReservationMailer.with(user: reservation.user, reservation: reservation).cancelled.deliver_later
  end
end
