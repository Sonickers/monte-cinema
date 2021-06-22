module Halls
  module UseCases
    class FetchAll
      def initialize(repository: Halls::Repository.new)
        @repository = repository
      end

      def call
        repository.find_all
      end

      private

      attr_reader :repository
    end
  end
end
