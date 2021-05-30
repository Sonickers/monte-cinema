FactoryBot.define do
  factory :seance do
    date { '2021-06-01' }
    time { '17:00' }
    movie_id { 1 }
    hall_id { 1 }
  end
end
