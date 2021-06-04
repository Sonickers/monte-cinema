module Seances
  module UseCases
    class Find
      attr_reader :repository, :id

      def initialize(id:, repository: Seances::Repository.new)
        @repository = repository
        @id = id
      end

      def call
        repository.find(id)
      end
    end
  end
end
