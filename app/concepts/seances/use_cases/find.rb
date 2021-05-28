module Seances
  module UseCases
    class Find
      attr_reader :repository

      def initialize(repository: Seances::Repository.new)
        @repository = repository
      end

      def call(id:)
        repository.find(id)
      end
    end
  end
end
