json.array!(@teams_competitions) do |teams_competition|
  json.extract! teams_competition, :id, :team_id, :competition_id
  json.url teams_competition_url(teams_competition, format: :json)
end
