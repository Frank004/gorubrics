json.array!(@sponsors) do |sponsor|
  json.extract! sponsor, :id, :name, :priority, :contribution
  json.url sponsor_url(sponsor, format: :json)
end
