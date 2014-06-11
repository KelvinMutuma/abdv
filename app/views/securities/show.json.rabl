object @security
	attributes :id, :security, :security_code, :category
	child :stock_quotes do 
		attributes :stock_quote_id, :security_id, :yesterday, :current, :price_change, :percentage_change, :high, :low, :published_at
	end


