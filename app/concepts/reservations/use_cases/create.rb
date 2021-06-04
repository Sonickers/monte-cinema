module Reservations
  module UseCases
    class Create
      attr_reader :repository, :params

      def initialize(params:, repository: Reservations::Repository.new)
        @repository = repository
        @params = params
      end

      def call
        repository.create(params.merge(reservation_status: ReservationStatus.booked))
      end
    end
  end
end
