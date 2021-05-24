module UseCases
    module Halls
        class Update
            attr_reader :repository

            def initialize(repository: Repositories::Halls.new)
                @repository = repository
            end

            def call(hall:, params:)
                repository.update(hall, params)
            end
        end
    end
end