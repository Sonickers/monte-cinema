class Reservation < ApplicationRecord
  belongs_to :seance
  belongs_to :reservation_status
end
