json.array!(@events) do |event|
  json.extract! event, :id, :title, :start_date, :end_date, :place, :city, :country, :organization_id
  json.url event_url(event, format: :json)
end
