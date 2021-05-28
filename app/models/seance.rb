class Seance < ApplicationRecord
  belongs_to :hall
  belongs_to :movie

  validates :movie_id, presence: true
  validates :hall_id, presence: true
end
