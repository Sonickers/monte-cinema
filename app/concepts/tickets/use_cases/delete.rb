module Tickets
  module UseCases
    class Delete
      attr_reader :repository

      def initialize(repository: Tickets::Repository.new)
        @repository = repository
      end

      def call(id:)
        repository.delete(id)
      end
    end
  end
end
