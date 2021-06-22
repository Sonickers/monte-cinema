require "administrate/base_dashboard"

class ReservationStatusDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    name: Field::String,
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    id
    name
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    id
    name
  ].freeze

  FORM_ATTRIBUTES = %i[
    name
  ].freeze

  COLLECTION_FILTERS = {}.freeze

  def display_resource(reservation_status)
    "(#{reservation_status.id}) #{reservation_status.name}"
  end
end
