class TicketType < ApplicationRecord
  validates :name, :price, presence: true
  # Create methods for retrieving all ticket types directly
  ['Adult', 'Child', 'Senior', 'Student'].each do |name|
    define_singleton_method(name.downcase) do
      find_by!(name: name)
    end
  end
end
