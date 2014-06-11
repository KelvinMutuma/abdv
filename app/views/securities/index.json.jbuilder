json.array!(@securities) do |security|
  json.extract! security, :id, :security, :security_code, :category
  json.url security_url(security, format: :json)
end
