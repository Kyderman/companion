json.array!(@fixtures) do |fixture|
  json.extract! fixture, :id, :gameweek, :location, :team_1, :team_2, :team_1_score, :team_2_score, :competition_id
  json.url fixture_url(fixture, format: :json)
end
