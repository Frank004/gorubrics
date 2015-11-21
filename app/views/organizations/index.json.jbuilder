json.array!(@organizations) do |organization|
  json.extract! organization, :id, :name, :phone, :city, :country, :website, :facebook, :twitter, :instagram
  json.url organization_url(organization, format: :json)
end
