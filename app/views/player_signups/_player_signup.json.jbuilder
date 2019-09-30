json.extract! player_signup, :id, :listing_id, :player_id, :created_at, :updated_at
json.url player_signup_url(player_signup, format: :json)
