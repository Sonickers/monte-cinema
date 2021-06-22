require "administrate/base_dashboard"

class TicketDeskDashboard < Administrate::BaseDashboard

  ATTRIBUTE_TYPES = {
    id: Field::Number,
    connection: Field::String,
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    id
    connection
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    id
    connection
  ].freeze

  FORM_ATTRIBUTES = %i[
    connection
  ].freeze

  COLLECTION_FILTERS = {}.freeze
end
