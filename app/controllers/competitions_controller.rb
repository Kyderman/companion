class CompetitionsController < ApplicationController
  before_action :set_competition, only: [:show, :edit, :update, :destroy]

  # GET /competitions
  # GET /competitions.json
  def index
    @competitions = Competition.all
  end

  # GET /competitions/1
  # GET /competitions/1.json
  def show
    @teams = @competition.calcLeague()
    
    @recentResults = @competition.fixtures.where("team_1_score IS NOT NULL")
    @upcomingFixtures = @competition.fixtures.where(:team_1_score => nil)
    
    @upcomingFixtures.sort_by! {|f| f.gameweek}
  end

  # GET /competitions/new
  def new
    @competition = Competition.new
  end

  # GET /competitions/1/edit
  def edit
  end

  # POST /competitions
  # POST /competitions.json
  def create
    @competition = Competition.new(competition_params)

    respond_to do |format|
      if @competition.save!
        @competition.update(:owner => current_user.id)
        @competition.createFixtures()
        format.html { redirect_to @competition, notice: 'Competition was successfully created.' }
        format.json { render action: 'show', status: :created, location: @competition }
      else
        format.html { render action: 'new' }
        format.json { render json: @competition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /competitions/1
  # PATCH/PUT /competitions/1.json
  def update
    @competition.teams_competitions.each do |l|
      l.destroy
    end
    respond_to do |format|
      if @competition.update(competition_params)
        
          @competition.fixtures.each do |f|
            if (!@competition.teams.include?(Team.find(f.team_1)) ||  !@competition.teams.include?(Team.find(f.team_2)))
              f.destroy
            end
          end
        
        format.html { redirect_to @competition, notice: 'Competition was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @competition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /competitions/1
  # DELETE /competitions/1.json
  def destroy
    @competition.destroy
    respond_to do |format|
      format.html { redirect_to competitions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_competition
      @competition = Competition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def competition_params
      params.require(:competition).permit(:name, :sport, :owner, teams_competitions_attributes: [:competition_id, :team_id, :_destroy])
    end
end
