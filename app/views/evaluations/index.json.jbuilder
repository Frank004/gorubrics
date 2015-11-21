json.array!(@evaluations) do |evaluation|
  json.extract! evaluation, :id, :note, :total_score, :participant_id, :member_id, :evaluation_builder_id, :event_id, :organization_id
  json.url evaluation_url(evaluation, format: :json)
end
