json.extract! author, :id, :name, :country_id, :goodreads_id, :bio, :dob, :created_at, :updated_at
json.url author_url(author, format: :json)
