require 'test_helper'

class TeamsCompetitionsControllerTest < ActionController::TestCase
  setup do
    @teams_competition = teams_competitions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:teams_competitions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create teams_competition" do
    assert_difference('TeamsCompetition.count') do
      post :create, teams_competition: { competition_id: @teams_competition.competition_id, team_id: @teams_competition.team_id }
    end

    assert_redirected_to teams_competition_path(assigns(:teams_competition))
  end

  test "should show teams_competition" do
    get :show, id: @teams_competition
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @teams_competition
    assert_response :success
  end

  test "should update teams_competition" do
    patch :update, id: @teams_competition, teams_competition: { competition_id: @teams_competition.competition_id, team_id: @teams_competition.team_id }
    assert_redirected_to teams_competition_path(assigns(:teams_competition))
  end

  test "should destroy teams_competition" do
    assert_difference('TeamsCompetition.count', -1) do
      delete :destroy, id: @teams_competition
    end

    assert_redirected_to teams_competitions_path
  end
end
