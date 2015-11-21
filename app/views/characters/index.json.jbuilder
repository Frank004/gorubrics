json.array!(@characters) do |character|
  json.extract! character, :id, :name, :series, :type, :participant_id, :event_id, :organization_id
  json.url character_url(character, format: :json)
end
