module Tickets
  module UseCases
    class Find
      attr_reader :repository, :id, :reservation_id

      def initialize(id:, reservation_id:, repository: Tickets::Repository.new)
        @repository = repository
        @id = id
        @reservation_id = reservation_id
      end

      def call
        repository.find(id, reservation_id)
      end
    end
  end
end
