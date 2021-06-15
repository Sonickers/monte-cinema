module Seances
  class Repository < ::BaseRepository
    def initialize(adapter: Seance)
      super(adapter: adapter)
    end

    def available_seats(seance)
      seance.hall.generate_seats - taken_seats(seance)
    end

    def taken_seats(seance)
      seance.reservations.where.not(reservation_status_id: ReservationStatus.cancelled.id)
            .flat_map(&:tickets).map(&:seat)
    end
  end
end
