class Security < ActiveRecord::Base
	has_many :stock_quotes, dependent: :destroy
end
