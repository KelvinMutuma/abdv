json.array!(@share_indices) do |share_index|
  json.extract! share_index, :id, :all_share_index, :twenty_share_index
  json.url share_index_url(share_index, format: :json)
end
