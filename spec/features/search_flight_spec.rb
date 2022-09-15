require 'rails_helper'

RSpec.feature 'SearchFlights', type: :feature do
  let(:atlanta) { FactoryBot.create(:airport, :atlanta) }
  let(:norfolk) { FactoryBot.create(:airport, :norfolk) }

  let(:flight) { create(:flight, :atl_orf, departure_airport: atlanta, arrival_airport: norfolk) }

  scenario 'avalible flights' do
    visit '/'
    select('ATL Atlanta, Georgia', from: 'departure_airport_id')
    # select('ORF Norfolk, Virginia', from: 'arrival_airport_id')
    # select('1', from: 'passenger_count')
    # select('09/14/2022', from: 'date')
    click_on 'Search'
    visit flights_path
    expect(page).to have_content('September 14 2022 | ORF Norfolk, Virginia - ATL Atlanta, Georgia ')
  end
end
