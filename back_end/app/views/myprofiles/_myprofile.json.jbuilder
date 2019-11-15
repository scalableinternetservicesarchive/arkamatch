json.extract! myprofile, :id, :created_at, :updated_at
json.url myprofile_url(myprofile, format: :json)
