require 'rails_helper'

RSpec.describe 'Seances representers' do
  let(:seance) { build(:seance, id: 1) }

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
