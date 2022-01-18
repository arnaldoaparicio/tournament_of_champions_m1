require 'rails_helper'

RSpec.describe 'Competition index page' do
  before(:each) do
    @comp1 = Competition.create!(name: 'Mens Regional', location: 'Louisville', sport: 'basketball')
    @comp2 = Competition.create!(name: 'Womens Regional', location: 'Rutgersville', sport: 'soccer')
    @comp3 = Competition.create!(name: 'Kids Regional', location: 'Cumberland', sport: 'hockey')
  end


  it 'shows the names of all the competitions' do
    visit '/competitions'
    expect(page).to have_content(@comp1.name)
    expect(page).to have_content(@comp2.name)
    expect(page).to have_content(@comp3.name)
  end

  it 'has the competition names link to their respective show page' do
    visit '/competitions'
    click_link "#{@comp1.name}"
    expect(current_path). to eq(competition_path(@comp1))
    expect(page).to have_content(@comp1.name)
    expect(page).to have_content(@comp1.location)
    expect(page).to have_content(@comp1.sport)
    expect(page).to_not have_content(@comp2.name)
    expect(page).to_not have_content(@comp3.name)
  end
end
