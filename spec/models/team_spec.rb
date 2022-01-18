require 'rails_helper'

RSpec.describe Team, type: :model do
  it { should have_many :players }
  it { should have_many :competition_teams }
  it { should have_many(:competitions).through(:competition_teams) }
end
