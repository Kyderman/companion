class Fixture < ActiveRecord::Base
  belongs_to :competition
  
  def getOpponent(team)
    if(self.team_1 == team)
      return self.team_2
    else
      return self.team_1  
    end
  end
  
  def isHome(team)
    if(self.team_1 == team)
      return true
    end
    return false
  end
  
  def getDashRes(team)
    if(isHome(team))
      return self.team_1_score.to_s() + " - " + self.team_2_score.to_s()
    else
      return self.team_2_score.to_s() + " - " + self.team_1_score.to_s()
    end
  end
  
  def self.getRecentResults(user)
    res = []
    user.teams.each do |t|
    t.competitions.each do |c|
      c.fixtures.each do |f|
        if (f.team_1_score == nil)
          next
        else
          if(f.team_1 == t.id || f.team_2 == t.id)
            res.push([f, t])
          end
        end
      end
    end
    end
    res.sort_by! {|e| -e[0].id}
    return res
  end

  def self.getRecentTeamRes(team)
    res = []
   
    team.competitions.each do |c|
      c.fixtures.each do |f|
        if (f.team_1_score == nil)
          next
        else
          if(f.team_1 == team.id || f.team_2 == team.id)
            res.push(f)
          end
        end
      end
    end
    res.sort_by! {|e| -e.id}
    return res
  end  
  
  def self.getTeamUpcoming(team)
    res = []
    team.competitions.each do |c|
      c.fixtures.each do |f|
        if (f.team_1_score == nil)
          if(f.team_1 == team.id || f.team_2 == team.id)
            res.push(f)
          end
        else
          next
        end
      end
    
    end
    res.sort_by! {|e| e.gameweek}
    return res
  end
  
  
  def self.getUpcoming(user)
    res = []
    user.teams.each do |t|
    t.competitions.each do |c|
      c.fixtures.each do |f|
        if (f.team_1_score == nil)
          if(f.team_1 == t.id || f.team_2 == t.id)
            res.push([f, t])
          end
        else
          next
        end
      end
    end
    end
    res.sort_by! {|e| e[0].gameweek}
    return res
  end
  
  
end
