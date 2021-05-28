module Halls
    module Representers
        class Single
            attr_reader :hall
            
            def initialize(hall)
                @hall = hall
            end
            
            def basic
                {
                    id: hall.id,
                    name: hall.name,
                    seats: hall.seats
                }
            end
        end
    end
end