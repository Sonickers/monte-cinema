class ReservationMailer < ApplicationMailer
  def booked
    @user = params[:user]
    @reservation = params[:reservation]
    @tickets = @reservation.tickets
    @seance = @reservation.seance
    @movie = @seance.movie

    mail(to: @user.email, subject: "#{@movie.title} - Reservation booked!")
  end
end
