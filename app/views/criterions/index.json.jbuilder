json.array!(@criterions) do |criterion|
  json.extract! criterion, :id, :name, :evaluation_builder_id, :organization_id
  json.url criterion_url(criterion, format: :json)
end
