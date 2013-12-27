json.array!(@links) do |link|
  json.extract! link, :url, :name
  json.url link_url(link, format: :json)
end
