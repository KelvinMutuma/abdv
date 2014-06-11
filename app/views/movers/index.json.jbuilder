json.array!(@movers) do |mover|
  json.extract! mover, :id, :mover, :volume
  json.url mover_url(mover, format: :json)
end
