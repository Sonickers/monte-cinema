module UseCases
    module Halls
        class Update
            attr_reader :repository

            def initialize(repository: Repositories::Halls.new)
                @repository = repository
            end

            def call(id:, params:)
                repository.update(id, params)
            end
        end
    end
end