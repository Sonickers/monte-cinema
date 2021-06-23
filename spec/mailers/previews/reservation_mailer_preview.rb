# Preview all emails at http://localhost:3000/rails/mailers/reservation_mailer
class ReservationMailerPreview < ActionMailer::Preview
  def booked
    user = User.first
    ReservationMailer.with(user: user, reservation: user.reservations.first).booked
  end
end
