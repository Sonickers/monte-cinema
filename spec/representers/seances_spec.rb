require 'rails_helper'

RSpec.describe 'Seances representers' do
  let(:hall) { Hall.create(name: 'A', seats: 200) }
  let(:movie) do
    Movie.create(
      title: 'Star Wars: Episode IV - A New Hope',
      length: 150,
      genre: 'Sci-Fi',
      poster_url: 'https://upload.wikimedia.org/wikipedia/en/8/87/StarWarsMoviePoster1977.jpg'
    )
  end

  let(:seance) { Seance.create(date: '2021-06-01', time: '17:30', movie_id: movie.id, hall_id: hall.id) }

  before do
    hall
    movie
    seance
  end

  describe 'Single' do
    it 'returnes a basic representation' do
      representation = Seances::Representers::Single.new(seance).basic
      expect(representation).to eq({
                                     id: seance.id,
                                     time: seance.time,
                                     date: seance.date,
                                     movie: seance.movie_id,
                                     hall: seance.hall_id
                                   })
    end
  end

  describe 'List' do
    it 'returns list of basic representations' do
      seances = [seance]
      representations = Seances::Representers::List.new(seances).basic
      expect(representations).to eq(
        [{
          id: seance.id,
          time: seance.time,
          date: seance.date,
          movie: seance.movie_id,
          hall: seance.hall_id
        }]
      )
    end
  end
end
