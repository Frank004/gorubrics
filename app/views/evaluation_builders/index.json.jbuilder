json.array!(@evaluation_builders) do |evaluation_builder|
  json.extract! evaluation_builder, :id, :name, :event_id, :organization_id, :category_id
  json.url evaluation_builder_url(evaluation_builder, format: :json)
end
