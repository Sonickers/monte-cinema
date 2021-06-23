require 'rails_helper'

RSpec.describe ReservationCancelWorker, type: :worker do
  let(:time) { (Time.zone.today + 30.minutes).to_datetime }
  let(:movie) { create(:movie) }
  let(:hall) { create(:hall) }
  let(:seance) { create(:seance, hall_id: hall.id, movie_id: movie.id) }
  let(:reservation) { create(:reservation, seance_id: seance.id) }
  let(:scheduled_job) { described_class.perform_at(time, reservation.id) }

  it 'adds the worker to queue' do
    described_class.perform_async(reservation.id)
    assert_equal 'default', described_class.queue
  end

  it 'goes into the jobs array for testing environment' do
    expect do
      described_class.perform_async(reservation.id)
    end.to change(described_class.jobs, :size).by(1)
  end

  context 'occurs daily' do
    it 'occurs at expected time' do
      scheduled_job
      assert_equal true, described_class.jobs.last['jid'].include?(scheduled_job)
      expect(described_class).to have_enqueued_sidekiq_job(reservation.id)
    end
  end
end
