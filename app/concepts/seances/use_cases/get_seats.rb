module Seances
  module UseCases
    class GetSeats
      attr_reader :repository, :seance

      def initialize(seance:, repository: Seances::Repository.new)
        @repository = repository
        @seance = seance
      end

      def call
        Seats.new(available: repository.available_seats(seance), taken: repository.taken_seats(seance))
      end
    end
  end
end
