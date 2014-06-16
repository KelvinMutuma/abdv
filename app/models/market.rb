# == Schema Information
#
# Table name: markets
#
#  id                    :integer          not null, primary key
#  equity_turnover       :float
#  market_capitalization :float
#  created_at            :datetime
#  updated_at            :datetime
#  guid                  :string(255)
#  published_at          :datetime
#

class Market < ActiveRecord::Base
end
