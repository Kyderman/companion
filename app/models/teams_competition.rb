class TeamsCompetition < ActiveRecord::Base
  belongs_to :team
  belongs_to :competition
end
