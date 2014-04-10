class HomeController < ApplicationController
  
def dashboard
  @teams = current_user.teams
end
end
