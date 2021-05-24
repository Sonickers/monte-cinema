module UseCases
    module Halls
        class Create
            attr_reader :repository

            def initialize(repository: Repositories::Halls.new)
                @repository = repository
            end

            def call(params:)
                repository.create(params)
            end
        end
    end
end