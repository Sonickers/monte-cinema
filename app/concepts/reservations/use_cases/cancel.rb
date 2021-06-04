module Reservations
  module UseCases
    class Cancel
      attr_reader :repository, :id

      def initialize(id:, repository: Reservations::Repository.new)
        @repository = repository
        @id = id
      end

      def call
        repository.set_status(id, ReservationStatus.cancelled)
      end
    end
  end
end
