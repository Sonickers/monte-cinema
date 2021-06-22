module Movies
  module UseCases
    class Find
      def initialize(repository: Movies::Repository.new)
        @repository = repository
      end

      def call(id:)
        repository.find(id)
      end

      private

      attr_reader :repository
    end
  end
end
