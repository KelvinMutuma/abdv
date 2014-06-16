# == Schema Information
#
# Table name: forexes
#
#  id           :integer          not null, primary key
#  currency     :string(255)
#  buy          :float
#  sell         :float
#  mean         :float
#  created_at   :datetime
#  updated_at   :datetime
#  guid         :string(255)
#  published_at :datetime
#

class Forex < ActiveRecord::Base
end
