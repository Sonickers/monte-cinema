class ReservationStatus < ApplicationRecord
  # Create methods for retrieving all statuses directly
  ['Booked', 'Confirmed', 'Cancelled'].each do |name|
    define_singleton_method(name.downcase) do
      find_by(name: name)
    end
  end
end
