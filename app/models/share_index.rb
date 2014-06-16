# == Schema Information
#
# Table name: share_indices
#
#  id                 :integer          not null, primary key
#  all_share_index    :float
#  twenty_share_index :float
#  created_at         :datetime
#  updated_at         :datetime
#  guid               :string(255)
#  published_at       :datetime
#

class ShareIndex < ActiveRecord::Base
end
