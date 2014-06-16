# == Schema Information
#
# Table name: banks
#
#  id               :integer          not null, primary key
#  volume           :integer
#  high             :float
#  low              :float
#  war              :float
#  window_borrowing :integer
#  created_at       :datetime
#  updated_at       :datetime
#  guid             :string(255)
#  published_at     :datetime
#

class Bank < ActiveRecord::Base
end
