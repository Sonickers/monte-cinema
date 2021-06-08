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
    end
  end
end
