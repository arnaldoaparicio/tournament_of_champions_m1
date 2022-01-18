require 'rails_helper'

RSpec.describe 'Competition index page' do
  before(:each) do
    @comp1 = Competition.create!(name: 'Mens Regional', location: 'Louisville', sport: 'basketball')
    @comp2 = Competition.create!(name: 'Womens Regional', location: 'Rutgersville', sport: 'soccer')
    @comp3 = Competition.create!(name: 'Kids Regional', location: 'Cumberland', sport: 'hockey')

    @team1 =  Team.create!(nickname: 'Rockets', hometown: 'Leesburg')
    @team2 =  Team.create!(nickname: 'Aristocrats', hometown: 'Smithville')
    @team3 =  Team.create!(nickname: 'Dreamers', hometown: 'Chicago')

    @player1 = @team1.players.create!(name: 'James Mitchell', age: 20)
    @player2 = @team1.players.create!(name: 'Bob Sapp', age: 31)
    @player3 = @team1.players.create!(name: 'Don Frye', age: 26)
    @player4 = @team2.players.create!(name: 'Joe Schmoe', age: 21)
    @player5 = @team2.players.create!(name: 'Karl Anderson', age: 40)
    @player6 = @team2.players.create!(name: 'Terry Gordy', age: 47)

    CompetitionTeam.create!(team: @team1, competition: @comp1)
    CompetitionTeam.create!(team: @team2, competition: @comp1)
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
