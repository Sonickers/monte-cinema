module UseCases
    module Halls
        class FetchAll
            attr_reader :repository

            def initialize(repository: Repositories::Halls.new)
                @repository = repository
            end

            def call
                repository.find_all
            end
        end
    end
end