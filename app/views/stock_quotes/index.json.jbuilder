json.array!(@stock_quotes) do |stock_quote|
  json.extract! stock_quote, :id, :security_id
  json.url stock_quote_url(stock_quote, format: :json)
end
