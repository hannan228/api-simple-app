json.extract! participant, :id, :name, :email, :fee, :created_at, :updated_at
json.url participant_url(participant, format: :json)
