class CompetitionsController < ApplicationController

def index
  @competitions = Competition.all
end


def show
  # binding.pry
  @competition = Competition.find(params[:id])
end
end
