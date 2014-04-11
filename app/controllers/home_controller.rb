class HomeController < ApplicationController
  
def dashboard
  @teams = current_user.teams
  @owned_comp = current_user.competitions
  @recent_result = Fixture.getRecentResults(current_user)
  @upcoming_fixture = Fixture.getUpcoming(current_user)
end
end
