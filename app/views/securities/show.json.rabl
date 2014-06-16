object @security
	attributes :id, :security, :security_code, :category
	child :stock_quotes do 
		attributes :id, :security_id, :yesterday, :current, :price_change, :percentage_change, :high, :low, :published_at
	end


