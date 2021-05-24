module Halls
    class Repository
        attr_reader :adapter

        def initialize(adapter: Hall)
            @adapter = adapter
        end

        def find_all
            adapter.all
        end

        def create(params)
            adapter.create(params)
        end

        def delete(id)
            adapter.destroy(id)
        end
    end
end