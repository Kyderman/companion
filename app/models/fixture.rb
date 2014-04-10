class Fixture < ActiveRecord::Base
  belongs_to :competition
  has_one :home_team, :class_name => "User"
  has_one :away_team, :class_name => "User"
end
