require 'rails_helper'

RSpec.describe 'Competition show page' do
  before(:each) do
    @comp1 = Competition.create!(name: 'Mens Regional', location: 'Louisville', sport: 'basketball')
    @comp2 = Competition.create!(name: 'Womens Regional', location: 'Rutgersville', sport: 'soccer')

    
  end

  it "shows the attributes" do
    visit competition_path(@comp1)
    expect(page).to have_content(@comp1.name)
    expect(page).to have_content(@comp1.location)
    expect(page).to have_content(@comp1.sport)
    expect(page).to_not have_content(@comp2.name)
  end
end
