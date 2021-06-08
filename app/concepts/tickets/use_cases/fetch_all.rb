module Tickets
  module UseCases
    class FetchAll
      attr_reader :reservation_id, :repository

      def initialize(reservation_id:, repository: Tickets::Repository.new)
        @reservation_id = reservation_id
        @repository = repository
      end

      def call
        repository.find_for_reservation_id(reservation_id: reservation_id)
      end
    end
  end
end
