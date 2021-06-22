module Reservations
  module UseCases
    class Cancel
      def initialize(id:, repository: Reservations::Repository.new)
        @repository = repository
        @id = id
      end

      def call
        repository.set_status(id, ReservationStatus.cancelled)
      end

      private

      attr_reader :repository, :id
    end
  end
end
