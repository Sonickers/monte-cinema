module Halls
    module UseCases
        class Update
            attr_reader :repository

            def initialize(repository: Halls::Repository.new)
                @repository = repository
            end

            def call(hall:, params:)
                repository.update(hall, params)
            end
        end
    end
end