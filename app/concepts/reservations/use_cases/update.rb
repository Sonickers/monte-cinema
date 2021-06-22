module Reservations
  module UseCases
    class Update
      def initialize(id:, params:, repository: Reservations::Repository.new)
        @repository = repository
        @id = id
        @params = params
      end

      def call
        repository.update(id, params)
      end

      private

      attr_reader :repository, :id, :params
    end
  end
end
