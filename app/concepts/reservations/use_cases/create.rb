module Reservations
  module UseCases
    class Create
      attr_reader :repository

      def initialize(repository: Reservations::Repository.new)
        @repository = repository
      end

      def call(params:)
        repository.create(params.merge(reservation_status: ReservationStatus.booked))
      end
    end
  end
end
