require "administrate/base_dashboard"

class TicketTypeDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    name: Field::String,
    price: Field::String.with_options(searchable: false),
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    id
    name
    price
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    id
    name
    price
  ].freeze

  FORM_ATTRIBUTES = %i[
    name
    price
  ].freeze

  COLLECTION_FILTERS = {}.freeze

  def display_resource(ticket_type)
    "(##{ticket_type.id}) #{ticket_type.name}"
  end
end
