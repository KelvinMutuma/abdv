# == Schema Information
#
# Table name: securities
#
#  id            :integer          not null, primary key
#  security      :string(255)
#  security_code :string(255)
#  category      :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class Security < ActiveRecord::Base
	has_many :stock_quotes, dependent: :destroy
end
