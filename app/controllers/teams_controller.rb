class TeamsController < ApplicationController

  def new
    @competition = Competition.find(params[:id])
  end

  def create
    competition = Competition.find(params[:id])
    team = Team.new(team_params)
    team.save
    CompetitionTeam.create!(team: team, competition: competition)
    redirect_to competition_path(competition)
  end

end

private

def team_params
  params.permit(:nickname, :hometown)
end
