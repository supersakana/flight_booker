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

    expect(page).to have_content("#{formatted_date} | ATL Atlanta, Georgia - ORF Norfolk, Virginia")
    expect(page).to have_content('08:00 AM')
  end

  scenario 'no date is selected' do
    visit '/'
    select('ATL Atlanta, Georgia', from: 'departure_airport_id')
    select('ORF Norfolk, Virginia', from: 'arrival_airport_id')
    select('2', from: 'passenger_count')
    click_on 'Search'

    expect(page).to have_content('Search for flight...')
    expect(page).to have_content('please input a date')
  end

  scenario 'departure and arrival airport are the same' do
    visit '/'
    select('ORF Norfolk, Virginia', from: 'departure_airport_id')
    select('ORF Norfolk, Virginia', from: 'arrival_airport_id')
    select('2', from: 'passenger_count')
    fill_in('date', with: Date.tomorrow)
    click_on 'Search'

    expect(page).to have_content('Search for flight...')
    expect(page).to have_content('departure and arrival flights should be different')
  end
end
