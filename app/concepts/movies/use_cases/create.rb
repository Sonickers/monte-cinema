module Movies
  module UseCases
    class Create
      def initialize(repository: Movies::Repository.new)
        @repository = repository
      end

      def call(params:)
        repository.create(params)
      end

      private

      attr_reader :repository
    end
  end
end
