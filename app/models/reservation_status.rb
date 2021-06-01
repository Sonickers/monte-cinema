class ReservationStatus < ApplicationRecord
  %w[Booked Confirmed Cancelled].each do |name|
    singleton_class.send(:define_method, name.downcase) do
      find_by(name: name)
    end
  end
end
