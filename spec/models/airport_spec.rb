require 'rails_helper'

RSpec.describe Airport, type: :model do
  describe '#info' do
    it "returns the airport's code and location" do
      airport = Airport.new(code: 'ORF', location: 'Norfolk, Virginia')
      expect(airport.info).to eq('ORF Norfolk, Virginia')
    end
  end
end
