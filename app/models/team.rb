class Team < ActiveRecord::Base
  has_many :teams_competitions
  has_many :competitions, through: :teams_competitions
  has_many :team_roster
  has_many :users, through: :team_roster
  has_many :fixtures
  
end
