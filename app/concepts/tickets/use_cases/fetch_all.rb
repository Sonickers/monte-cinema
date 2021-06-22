module Tickets
  module UseCases
    class FetchAll
      def initialize(reservation_id:, repository: Tickets::Repository.new)
        @reservation_id = reservation_id
        @repository = repository
      end

      def call
        repository.find_for_reservation_id(reservation_id: reservation_id)
      end

      private

      attr_reader :reservation_id, :repository
    end
  end
end
