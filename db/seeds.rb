# Create static statuses
status_names = %w[Booked Confirmed Cancelled]

status_names.each do |name|
  ReservationStatus.create(name: name)
end

# Create default ticket desks
TicketDesk.create(connection: 'Online')
4.times { TicketDesk.create(connection: 'Offline') }
