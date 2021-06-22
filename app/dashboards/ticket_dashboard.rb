require 'administrate/base_dashboard'

class TicketDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    reservation: Field::BelongsTo,
    ticket_type: Field::BelongsTo,
    id: Field::Number,
    seat: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    reservation
    ticket_type
    id
    seat
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    reservation
    ticket_type
    id
    seat
    created_at
    updated_at
  ].freeze

  FORM_ATTRIBUTES = %i[
    reservation
    ticket_type
    seat
  ].freeze

  COLLECTION_FILTERS = {}.freeze
end
