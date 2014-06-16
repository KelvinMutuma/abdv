# == Schema Information
#
# Table name: stock_quotes
#
#  id                :integer          not null, primary key
#  security_id       :integer
#  created_at        :datetime
#  updated_at        :datetime
#  yesterday         :float            default(0.0)
#  current           :float            default(0.0)
#  price_change      :float            default(0.0)
#  percentage_change :float            default(0.0)
#  high              :float            default(0.0)
#  low               :float            default(0.0)
#  guid              :string(255)
#  published_at      :datetime
#

class StockQuote < ActiveRecord::Base
  belongs_to :security
end
