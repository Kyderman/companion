class TeamRostersController < ApplicationController
  before_action :set_team_roster, only: [:show, :edit, :update, :destroy]

  # GET /team_rosters
  # GET /team_rosters.json
  def index
    @team_rosters = TeamRoster.all
  end

  # GET /team_rosters/1
  # GET /team_rosters/1.json
  def show
  end

  # GET /team_rosters/new
  def new
    @team_roster = TeamRoster.new
  end

  # GET /team_rosters/1/edit
  def edit
  end

  # POST /team_rosters
  # POST /team_rosters.json
  def create
    @team_roster = TeamRoster.new(team_roster_params)

    respond_to do |format|
      if @team_roster.save
        format.html { redirect_to @team_roster, notice: 'Team roster was successfully created.' }
        format.json { render action: 'show', status: :created, location: @team_roster }
      else
        format.html { render action: 'new' }
        format.json { render json: @team_roster.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /team_rosters/1
  # PATCH/PUT /team_rosters/1.json
  def update
    respond_to do |format|
      if @team_roster.update(team_roster_params)
        format.html { redirect_to @team_roster, notice: 'Team roster was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @team_roster.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /team_rosters/1
  # DELETE /team_rosters/1.json
  def destroy
    @team_roster.destroy
    respond_to do |format|
      format.html { redirect_to team_rosters_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team_roster
      @team_roster = TeamRoster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_roster_params
      params.require(:team_roster).permit(:team_id, :user_id)
    end
end
