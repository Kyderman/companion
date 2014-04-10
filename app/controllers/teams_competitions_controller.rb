class TeamsCompetitionsController < ApplicationController
  before_action :set_teams_competition, only: [:show, :edit, :update, :destroy]

  # GET /teams_competitions
  # GET /teams_competitions.json
  def index
    @teams_competitions = TeamsCompetition.all
  end

  # GET /teams_competitions/1
  # GET /teams_competitions/1.json
  def show
  end

  # GET /teams_competitions/new
  def new
    @teams_competition = TeamsCompetition.new
  end

  # GET /teams_competitions/1/edit
  def edit
  end

  # POST /teams_competitions
  # POST /teams_competitions.json
  def create
    @teams_competition = TeamsCompetition.new(teams_competition_params)

    respond_to do |format|
      if @teams_competition.save
        format.html { redirect_to @teams_competition, notice: 'Teams competition was successfully created.' }
        format.json { render action: 'show', status: :created, location: @teams_competition }
      else
        format.html { render action: 'new' }
        format.json { render json: @teams_competition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams_competitions/1
  # PATCH/PUT /teams_competitions/1.json
  def update
    respond_to do |format|
      if @teams_competition.update(teams_competition_params)
        format.html { redirect_to @teams_competition, notice: 'Teams competition was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @teams_competition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams_competitions/1
  # DELETE /teams_competitions/1.json
  def destroy
    @teams_competition.destroy
    respond_to do |format|
      format.html { redirect_to teams_competitions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teams_competition
      @teams_competition = TeamsCompetition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def teams_competition_params
      params.require(:teams_competition).permit(:team_id, :competition_id)
    end
end
