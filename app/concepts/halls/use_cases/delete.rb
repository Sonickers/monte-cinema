module Halls
  module UseCases
    class Delete
      def initialize(repository: Halls::Repository.new)
        @repository = repository
      end

      def call(id:)
        repository.delete(id)
      end

      private

      attr_reader :repository
    end
  end
end
