status_names = %w[Booked Confirmed Cancelled]

status_names.each do |name|
  ReservationStatus.create(name: name)
end
