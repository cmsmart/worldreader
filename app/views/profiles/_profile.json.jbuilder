json.extract! profile, :id, :username, :first_name, :last_name, :user_id, :avatar_data, :created_at, :updated_at
json.url profile_url(profile, format: :json)
