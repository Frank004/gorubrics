json.array!(@categories) do |category|
  json.extract! category, :id, :name, :organization_id
  json.url category_url(category, format: :json)
end
