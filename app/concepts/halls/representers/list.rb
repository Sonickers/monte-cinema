module Halls
    module Representers
        class List
            attr_reader :halls

            def initialize(halls)
                @halls = halls
            end

            def basic
                halls.map do |hall|
                    {
                        id: hall.id,
                        name: hall.name,
                        seats: hall.seats
                    }
                end
            end
        end
    end
end