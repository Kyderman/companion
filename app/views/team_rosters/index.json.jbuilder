json.array!(@team_rosters) do |team_roster|
  json.extract! team_roster, :id, :team_id, :user_id
  json.url team_roster_url(team_roster, format: :json)
end
