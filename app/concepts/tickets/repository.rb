module Tickets
  class Repository < ::BaseRepository
    def initialize(adapter: Ticket)
      super(adapter: adapter)
    end

    def find(id:, reservation_id:)
      adapter.find_by!(id: id, reservation_id: reservation_id)
    end

    def find_for_reservation_id(reservation_id:)
      adapter.where(reservation_id: reservation_id).all
    end
  end
end
