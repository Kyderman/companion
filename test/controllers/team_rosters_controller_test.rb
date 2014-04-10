require 'test_helper'

class TeamRostersControllerTest < ActionController::TestCase
  setup do
    @team_roster = team_rosters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:team_rosters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create team_roster" do
    assert_difference('TeamRoster.count') do
      post :create, team_roster: { team_id: @team_roster.team_id, user_id: @team_roster.user_id }
    end

    assert_redirected_to team_roster_path(assigns(:team_roster))
  end

  test "should show team_roster" do
    get :show, id: @team_roster
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @team_roster
    assert_response :success
  end

  test "should update team_roster" do
    patch :update, id: @team_roster, team_roster: { team_id: @team_roster.team_id, user_id: @team_roster.user_id }
    assert_redirected_to team_roster_path(assigns(:team_roster))
  end

  test "should destroy team_roster" do
    assert_difference('TeamRoster.count', -1) do
      delete :destroy, id: @team_roster
    end

    assert_redirected_to team_rosters_path
  end
end
