# == Schema Information
#
# Table name: changers
#
#  id                :integer          not null, primary key
#  security          :string(255)
#  price             :float
#  percentage_change :float
#  created_at        :datetime
#  updated_at        :datetime
#  guid              :string(255)
#  published_at      :datetime
#

class Changer < ActiveRecord::Base
end
