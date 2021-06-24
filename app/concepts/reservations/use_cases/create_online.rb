module Reservations
  module UseCases
    class CreateOnline
      def initialize(params:, repository: Reservations::Repository.new)
        @repository = repository
        @params = params
      end

      def call
        ActiveRecord::Base.transaction do
          repository.create!(reservation_params).tap do |reservation|
            Tickets::UseCases::Create.new(reservation: reservation, tickets: params[:tickets]).call

            ReservationMailer.with(user: params[:user], reservation: reservation).booked.deliver_later
            schedule_reservation_expiry(reservation: reservation)
          end
        end
      end

      private

      attr_reader :repository, :params

      def reservation_params
        {
          seance_id: params[:seance_id],
          reservation_status: ReservationStatus.booked,
          ticket_desk: TicketDesk.online,
          user_id: params[:user].id
        }
      end

      def schedule_reservation_expiry(reservation:)
        cancel_date = reservation.seance.confirmation_deadline
        ReservationCancelWorker.perform_at(cancel_date, reservation.id)
      end
    end
  end
end
