require 'rails_helper'

RSpec.feature 'SearchFlights', type: :feature do
  scenario 'avalible flights' do
    visit '/'
    select('ATL Atlanta, Georgia', from: 'departure_airport_id')
    # fill_in 'To', with: 'ORF Norfolk, Virginia'
    # fill_in 'Passengers', with: '1'
    # fill_in 'Date', with: '09/14/2022'
    click_on 'Search'
    visit flights_path
    expect(page).to have_content('September 14 2022 | ORF Norfolk, Virginia - ATL Atlanta, Georgia ')
  end
end
