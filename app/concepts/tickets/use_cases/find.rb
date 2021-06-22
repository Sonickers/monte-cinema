module Tickets
  module UseCases
    class Find
      def initialize(id:, reservation_id:, repository: Tickets::Repository.new)
        @repository = repository
        @id = id
        @reservation_id = reservation_id
      end

      def call
        repository.find(id: id, reservation_id: reservation_id)
      end

      private

      attr_reader :repository, :id, :reservation_id
    end
  end
end
