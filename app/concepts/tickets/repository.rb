module Tickets
  class Repository < ::BaseRepository
    def initialize(adapter: Ticket)
      super(adapter: adapter)
    end

    def find(id, reservation_id)
      adapter.where(id: id, reservation_id: reservation_id).first!
    end
  end
end
