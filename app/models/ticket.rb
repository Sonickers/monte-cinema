class Ticket < ApplicationRecord
  belongs_to :reservation
  belongs_to :ticket_type
end
