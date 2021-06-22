module Halls
  module UseCases
    class Update
      def initialize(repository: Halls::Repository.new)
        @repository = repository
      end

      def call(id:, params:)
        repository.update(id, params)
      end

      private

      attr_reader :repository
    end
  end
end
