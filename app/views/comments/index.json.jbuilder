json.array!(@comments) do |comment|
  json.extract! comment, :comment, :score, :link_id
  json.url comment_url(comment, format: :json)
end
