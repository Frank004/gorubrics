json.array!(@promos) do |promo|
  json.extract! promo, :id, :title, :content, :start_date, :end_date, :event_id, :organization_id
  json.url promo_url(promo, format: :json)
end
