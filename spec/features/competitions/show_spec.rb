require 'rails_helper'

RSpec.describe 'Competition show page' do
  before(:each) do
    @comp1 = Competition.create!(name: 'Mens Regional', location: 'Louisville', sport: 'basketball')
    @comp2 = Competition.create!(name: 'Womens Regional', location: 'Rutgersville', sport: 'soccer')

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

  it "shows the attributes" do
    visit competition_path(@comp1)
    expect(page).to have_content(@comp1.name)
    expect(page).to have_content(@comp1.location)
    expect(page).to have_content(@comp1.sport)
    expect(page).to_not have_content(@comp2.name)
  end

  it 'has the list of competitions teams with their hometowns' do
    visit competition_path(@comp1)
    save_and_open_page
    expect(page).to have_content(@team1.nickname)
    expect(page).to have_content(@team1.hometown)
    expect(page).to have_content(@team2.nickname)
    expect(page).to have_content(@team2.hometown)
    expect(page).to_not have_content(@team3.nickname)
    expect(page).to_not have_content(@team3.hometown)
  end

  it 'shows the average age of all players' do
    visit competition_path(@comp1)
    expect(@comp1.average_age).to eq(31)
    expect(page).to have_content('Average age of all players in this competition: 31')
  end

 it 'links to a new page to register a new team' do
    visit competition_path(@comp1)
    click_link "Register a new team"
    expect(current_path).to 
 end
end
