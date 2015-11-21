json.array!(@scores) do |score|
  json.extract! score, :id, :overall_score, :participant_id, :event_id, :evaluation_id
  json.url score_url(score, format: :json)
end
