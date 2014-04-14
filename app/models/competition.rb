class Competition < ActiveRecord::Base
  has_many :fixtures
  has_many :teams_competitions
  has_many :teams, through: :teams_competitions
  accepts_nested_attributes_for :teams_competitions, :reject_if=>:all_blank, :allow_destroy=>true
  accepts_nested_attributes_for :teams, :reject_if=>:all_blank, :allow_destroy=>true
  
  def createFixtures()
    team_count = self.teams.count
    
    even = false
    
    if(team_count % 2 == 0)
      even = true
    else
      team_count += 1
      teams_array.push(0)  
    end
    
    
    team_array = self.teams
    
    if(!even)
      
    end
    rounds = (2*team_count) - 2
    round = 1
    
    i = 0
    while i <= rounds do
      cur_team = 1
      teams_array.each do |t|
        if(cur_team <= (team_count / 2))
        Fixture.create(:team_1_id => t.id, :team_2_id => teams_array[(team_count / 2)+cur_team].id, 
        :competition_id => self.id, :gameweek => i)
        cur_team += 1
        end
        end
      
      round += 1
    end  
    
  end
end
