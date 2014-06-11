json.array!(@changers) do |changer|
  json.extract! changer, :id, :security, :price, :percentage_change
  json.url changer_url(changer, format: :json)
end
