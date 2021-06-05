class TicketDesk < ApplicationRecord
  def self.online
    find_by(connection: 'Online')
  end
end
