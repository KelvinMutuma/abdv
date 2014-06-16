# == Schema Information
#
# Table name: movers
#
#  id           :integer          not null, primary key
#  mover        :string(255)
#  volume       :integer
#  created_at   :datetime
#  updated_at   :datetime
#  guid         :string(255)
#  published_at :datetime
#

class Mover < ActiveRecord::Base
end
