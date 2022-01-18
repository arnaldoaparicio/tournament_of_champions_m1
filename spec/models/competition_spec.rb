require 'rails_helper'

RSpec.describe Competition, type: :model do
  it { should have_many :competition_teams }
  it { should have_many(:teams).through(:competition_teams) }
  before(:each) do
    @comp1 = Competition.create!(name: 'Mens Regional', location: 'Louisville', sport: 'basketball')

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

  it 'shows the average age of all players' do
    expect(@comp1.average_age).to eq(31)
  end
end
