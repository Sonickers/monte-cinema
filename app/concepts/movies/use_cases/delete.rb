module Movies
  module UseCases
    class Delete
      def initialize(repository: Movies::Repository.new)
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
