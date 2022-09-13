require 'rails_helper'

RSpec.describe Flight, type: :model do
  let(:norfolk) { Airport.new(code: 'ORF', location: 'Norfolk, Virginia') }
  let(:atlanta) { Airport.new(code: 'ATL', location: 'Atlanta, Georgia') }
end
