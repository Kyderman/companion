json.array!(@teams_users) do |teams_user|
  json.extract! teams_user, :id, :team_id, :user_id
  json.url teams_user_url(teams_user, format: :json)
end
