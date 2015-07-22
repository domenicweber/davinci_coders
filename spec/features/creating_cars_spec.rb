require 'rails_helper'

feature 'Creating Cars' do
  scenario 'can create a car' do
    visit '/'

    click_link 'New Car'

    fill_in 'Make', with: 'Ford'
    fill_in 'Model', with: 'Mustang'
    fill_in 'Year', with: '1967'
    fill_in 'Price', with: '2300'

    click_button 'Create Car'

    expect(page).to have_content('1967 Ford Mustang has been created')

    within("#car_table") do
      expect(page).to have_content('Ford')
      expect(page).to have_content('Mustang')
      expect(page).to have_content('1967')
      expect(page).to have_content('$2,300.00')
    end
  end


# feature 'Create another Car' do
   # scenario 'can create a 2nd car' do
  #   visit 'cars/new'
  #
  #   fill_in 'Make', with: 'Dodge'
  #   fill_in 'Model', with: 'Ram'
  #   fill_in 'Year', with: '2010'
  #   fill_in 'Price', with: '35000'
  #
  #   click_button 'Create Car'
  #
  #   expect(page).to have_content('2010 Dodge Ram has been created')

  scenario 'can create a second car' do
    @car = Car.create(make: 'Toyota', model: 'Camry', year: '2000', price: '23423')

    visit '/'

    click_link 'New Car'

    fill_in 'Make', with: 'Ford'
    fill_in 'Model', with: 'Mustang'
    fill_in 'Year', with: '1967'
    fill_in 'Price', with: '2300'

    click_button 'Create Car'

    expect(page).to have_content('1967 Ford Mustang has been created')

    within("#car_table") do
      expect(page).to have_content('Ford')
      expect(page).to have_content('Mustang')
      expect(page).to have_content('1967')
      expect(page).to have_content('$2,300.00')

      expect(page).to have_content('Toyota')
      expect(page).to have_content('Camry')
      expect(page).to have_content('2000')
      expect(page).to have_content('$23,423.00')
    end
  end
end







# feature 'List of Cars' do
#    scenario 'shows a list of cars on index page' do
#      visit '/'
# #
# #     # within('#car_table') do
#        expect(page).to have_table('car_table')
# #   #   within (#car_table) do
# #   #   expect(page).to have_content(“1967”)
# #   #   expect(page).to have_content(“Ford”)
# #   #   expect(page).to have_content(“Mustang”)
# #   #   expect(page).to have_content(“$2300.00”)
# #   # end
#  end
# end


