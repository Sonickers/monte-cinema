class Seats
  attr_reader :available, :taken

  def initialize(available: [], taken: [])
    @available = available
    @taken = taken
  end

  def to_hash
    {
      available_seats: available,
      taken_seats: taken
    }
  end
end
