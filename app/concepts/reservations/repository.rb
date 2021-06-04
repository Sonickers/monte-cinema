module Reservations
  class Repository < ::BaseRepository
    def initialize(adapter: Reservation)
      super(adapter: adapter)
    end

    def set_status(id, status)
      adapter.update(id, reservation_status: status)
    end
  end
end
