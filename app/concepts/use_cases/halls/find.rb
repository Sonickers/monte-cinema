module UseCases
    module Halls
        class Find
            attr_reader :repository

            def initialize(repository: Repositories::Halls.new)
                @repository = repository
            end

            def call(id:)
                repository.find(id)
            end
        end
    end
end