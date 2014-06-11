json.array!(@markets) do |market|
  json.extract! market, :id, :equity_turnover, :market_capitalization
  json.url market_url(market, format: :json)
end
