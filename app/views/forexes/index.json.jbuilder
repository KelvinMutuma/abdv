json.array!(@forexes) do |forex|
  json.extract! forex, :id, :currency, :buy, :sell, :mean
  json.url forex_url(forex, format: :json)
end
