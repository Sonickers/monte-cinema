module Seances
  module UseCases
    class Find
      def initialize(id:, repository: Seances::Repository.new)
        @repository = repository
        @id = id
      end

      def call
        repository.find(id)
      end

      private

      attr_reader :repository, :id
    end
  end
end
