class Competition < ApplicationRecord
  has_many :competition_teams
  has_many :teams, through: :competition_teams


  def average_age
    teams.joins(:players).average(:age).round
  end
end
