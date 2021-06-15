module Reservations
  module UseCases
    class CreateOffline
      attr_reader :repository, :params

      def initialize(params:, repository: Reservations::Repository.new)
        @repository = repository
        @params = params
      end

      def call
        ActiveRecord::Base.transaction do
          repository.create!(reservation_params).tap do |reservation|
            Tickets::UseCases::Create.new(reservation: reservation, tickets: params[:tickets]).call
            cancel_expired(reservation: reservation)
          end
        end
      end

      private

      def reservation_params
        {
          seance_id: params[:seance_id],
          reservation_status_id: params[:reservation_status_id],
          ticket_desk_id: params[:ticket_desk_id]
        }
      end

      def cancel_expired(reservation:)
        cancel_date = reservation.seance.confirmation_deadline
        ReservationCancelWorker.perform_at(cancel_date, reservation.id)
      end
    end
  end
end
