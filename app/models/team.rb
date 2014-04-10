class Team < ActiveRecord::Base
  
  has_many :competitions, through: :teams_competition
  has_many :users, through: :team_roster
  has_many :fixtures
end
