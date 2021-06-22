require 'administrate/base_dashboard'

class ReservationDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    seance: Field::BelongsTo,
    reservation_status: Field::BelongsTo,
    ticket_desk: Field::BelongsTo,
    user: Field::BelongsTo,
    tickets: Field::HasMany,
    id: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    seance
    reservation_status
    ticket_desk
    user
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    seance
    reservation_status
    ticket_desk
    user
    tickets
    id
    created_at
    updated_at
  ].freeze

  FORM_ATTRIBUTES = %i[
    seance
    reservation_status
    ticket_desk
    user
    tickets
  ].freeze

  COLLECTION_FILTERS = {}.freeze
end
