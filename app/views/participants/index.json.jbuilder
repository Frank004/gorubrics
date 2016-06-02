json.array!(@participants) do |participant|
  json.extract! participant, :id, :first_name, :last_name, :age, :city, :email, :phone, :event_id, :character_id, :organization_id
  json.url participant_url(participant, format: :json)
end
