module Seances
  module UseCases
    class Delete
      def initialize(repository: Seances::Repository.new)
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
