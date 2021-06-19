require 'rails_helper'

RSpec.describe 'Seances representers' do
  let(:seance) { build(:seance, id: 1) }

  describe 'Single' do
    it 'returnes a basic representation' do
      representation = Seances::Representers::Single.new(seance).basic
      expect(representation).to eq({
                                     id: seance.id,
                                     datetime: seance.datetime,
                                     movie: seance.movie_id,
                                     hall: seance.hall_id
                                   })
    end

    it 'returnes an extended representation' do
      seats = Seats.new(available: ['A1, A2'], taken: ['A3'])
      representation = Seances::Representers::Single.new(seance, seats: seats).extended

      expect(representation).to eq({
                                     id: seance.id,
                                     datetime: seance.datetime,
                                     movie: seance.movie_id,
                                     hall: seance.hall_id,
                                     available_seats: seats.available,
                                     taken_seats: seats.taken
                                   })
    end

    it 'returnes an extended representation with no seats given' do
      representation = Seances::Representers::Single.new(seance).extended

      expect(representation).to eq({
                                     id: seance.id,
                                     datetime: seance.datetime,
                                     movie: seance.movie_id,
                                     hall: seance.hall_id,
                                     available_seats: [],
                                     taken_seats: []
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
          datetime: seance.datetime,
          movie: seance.movie_id,
          hall: seance.hall_id
        }]
      )
    end
  end
end
