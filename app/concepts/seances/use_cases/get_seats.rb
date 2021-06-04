module Seances
  module UseCases
    class GetSeats
      attr_reader :repository, :seance

      def initialize(seance:, repository: Seances::Repository.new)
        @repository = repository
        @seance = seance
      end

      def call
        {
          available_seats: repository.available_seats(seance),
          taken_seats: repository.taken_seats(seance)
        }
      end
    end
  end
end
