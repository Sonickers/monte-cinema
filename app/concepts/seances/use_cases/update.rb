module Seances
  module UseCases
    class Update
      def initialize(repository: Seances::Repository.new)
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
