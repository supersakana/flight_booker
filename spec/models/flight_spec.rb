require 'rails_helper'

RSpec.describe Flight, type: :model do
  let(:norfolk) { Airport.new(code: 'ORF', location: 'Norfolk, Virginia') }
  let(:atlanta) { Airport.new(code: 'ATL', location: 'Atlanta, Georgia') }

  subject(:flight) do
    described_class.new(departure_airport: norfolk, arrival_airport: atlanta, date: '14 Sep 2022' , time: '8:00AM')
  end

  describe '#from' do
    it 'returns the departure airport information' do
      expect(flight.from).to eq('ORF Norfolk, Virginia')
    end
  end

  describe '#to' do
    it 'returns the arrival airport information' do
      expect(flight.to).to eq('ATL Atlanta, Georgia')
    end
  end

  describe '#details' do
    it 'returns the time, date, departing, and arriving airport' do
      result = '08:00 AM 2022-09-14 ORF Norfolk, Virginia - ATL Atlanta, Georgia'
      expect(flight.details).to eq(result)
    end
  end
end
