module UseCases
    module Halls
        class Delete
            attr_reader :repository

            def initialize(repository: Repositories::Halls.new)
                @repository = repository
            end

            def call(id:)
                repository.delete(id)
            end
        end
    end
end