json.array!(@banks) do |bank|
  json.extract! bank, :id, :volume, :high, :low, :war, :window_borrowing
  json.url bank_url(bank, format: :json)
end
