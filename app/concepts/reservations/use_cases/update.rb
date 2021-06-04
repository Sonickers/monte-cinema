module Reservations
  module UseCases
    class Update
      attr_reader :repository, :id, :params

      def initialize(id:, params:, repository: Reservations::Repository.new)
        @repository = repository
        @id = id
        @params = params
      end

      def call
        repository.update(id, params)
      end
    end
  end
end
