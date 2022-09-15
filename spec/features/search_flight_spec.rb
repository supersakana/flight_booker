require 'rails_helper'

RSpec.feature 'SearchFlights', type: :feature do
  let!(:atlanta) { create(:airport, :atlanta) }
  let!(:norfolk) { create(:airport, :norfolk) }

  let!(:flight) { create(:flight, :atl_orf, departure_airport: atlanta, arrival_airport: norfolk) }

  scenario 'avalible flights' do
    visit '/'
    select('ATL Atlanta, Georgia', from: 'departure_airport_id')
    select('ORF Norfolk, Virginia', from: 'arrival_airport_id')
    select('2', from: 'passenger_count')
    fill_in('date', with: Date.tomorrow)
    click_on 'Search'
    formatted_date = Date.tomorrow.strftime('%B %d %Y')
    sleep(3)
    expect(page).to have_content("#{formatted_date} | ATL Atlanta, Georgia - ORF Norfolk, Virginia")
  end
end
