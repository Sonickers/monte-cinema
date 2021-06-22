require "administrate/base_dashboard"

class HallDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    seats: Field::Number,
    name: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    id
    seats
    name
    created_at
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    id
    seats
    name
    created_at
    updated_at
  ].freeze

  FORM_ATTRIBUTES = %i[
    seats
    name
  ].freeze

  COLLECTION_FILTERS = {}.freeze

  def display_resource(hall)
    "(##{hall.id}) Hall #{hall.name}"
  end
end
