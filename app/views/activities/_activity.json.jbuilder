json.extract! activity, :id, :name, :description, :image_url, :wiki_link, :created_at, :updated_at
json.url activity_url(activity, format: :json)
