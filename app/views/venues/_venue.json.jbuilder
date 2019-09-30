json.extract! venue, :id, :name, :area_id, :description, :type, :created_at, :updated_at
json.url venue_url(venue, format: :json)
