class TeamsUsersController < ApplicationController
  before_action :set_teams_user, only: [:show, :edit, :update, :destroy]

  # GET /teams_users
  # GET /teams_users.json
  def index
    @teams_users = TeamsUser.all
  end

  # GET /teams_users/1
  # GET /teams_users/1.json
  def show
  end

  # GET /teams_users/new
  def new
    @teams_user = TeamsUser.new
  end

  # GET /teams_users/1/edit
  def edit
  end

  # POST /teams_users
  # POST /teams_users.json
  def create
    @teams_user = TeamsUser.new(teams_user_params)

    respond_to do |format|
      if @teams_user.save
        format.html { redirect_to @teams_user, notice: 'Teams user was successfully created.' }
        format.json { render action: 'show', status: :created, location: @teams_user }
      else
        format.html { render action: 'new' }
        format.json { render json: @teams_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams_users/1
  # PATCH/PUT /teams_users/1.json
  def update
    respond_to do |format|
      if @teams_user.update(teams_user_params)
        format.html { redirect_to @teams_user, notice: 'Teams user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @teams_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams_users/1
  # DELETE /teams_users/1.json
  def destroy
    @teams_user.destroy
    respond_to do |format|
      format.html { redirect_to teams_users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teams_user
      @teams_user = TeamsUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def teams_user_params
      params.require(:teams_user).permit(:team_id, :user_id)
    end
end
