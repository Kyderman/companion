class Competition < ActiveRecord::Base
  has_many :fixtures, :dependent => :destroy
  has_many :teams_competitions
  has_many :teams, through: :teams_competitions
  accepts_nested_attributes_for :teams_competitions, :reject_if=>:all_blank, :allow_destroy=>true
  accepts_nested_attributes_for :teams, :reject_if=>:all_blank, :allow_destroy=>true
  
  def createFixtures()
    team_count = self.teams.count
    team_array = self.teams
    even = false
    
    if(team_count % 2 == 0)
      rounds = team_count - 1
      even = true
    else
      team_count += 1
      rounds = team_count - 1
      team_array.push(bye = Team.new(:name => "bye12"))  
    end
    
    round = 1
    
    
    while round <= rounds do
      cur_team = 0
      team_array.each do |t|
        
          if(cur_team <= (team_count / 2)-1)
            opponent = team_array[team_count - 1 - cur_team]
            if(opponent.name != "bye12" && t.name != "bye12")
            Fixture.create(:team_1 => t.id, :team_2 => opponent.id, 
            :competition_id => self.id, :gameweek => round)
            Fixture.create(:team_1 => opponent.id, :team_2 => t.id, 
            :competition_id => self.id, :gameweek => rounds + round)
            end
          end
        
        cur_team += 1
      end
      team_array = permArray(team_array)
      round += 1
    end 
    if(!even) 
      bye.destroy
    end
  end
  
  def permArray(ar)
    newar = []
    currentin = 0
    ar.each do |e|
      if(currentin != ar.length - 1)
        newar.push(e)
      else
        newar.insert(1, e)
      end
      currentin += 1  
    end
    return newar
  end
end
