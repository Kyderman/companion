require 'test_helper'

class FixturesControllerTest < ActionController::TestCase
  setup do
    @fixture = fixtures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fixtures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fixture" do
    assert_difference('Fixture.count') do
      post :create, fixture: { competition_id: @fixture.competition_id, gameweek: @fixture.gameweek, location: @fixture.location, team_1: @fixture.team_1, team_1_score: @fixture.team_1_score, team_2: @fixture.team_2, team_2_score: @fixture.team_2_score }
    end

    assert_redirected_to fixture_path(assigns(:fixture))
  end

  test "should show fixture" do
    get :show, id: @fixture
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fixture
    assert_response :success
  end

  test "should update fixture" do
    patch :update, id: @fixture, fixture: { competition_id: @fixture.competition_id, gameweek: @fixture.gameweek, location: @fixture.location, team_1: @fixture.team_1, team_1_score: @fixture.team_1_score, team_2: @fixture.team_2, team_2_score: @fixture.team_2_score }
    assert_redirected_to fixture_path(assigns(:fixture))
  end

  test "should destroy fixture" do
    assert_difference('Fixture.count', -1) do
      delete :destroy, id: @fixture
    end

    assert_redirected_to fixtures_path
  end
end
