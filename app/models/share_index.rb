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
	feed_url = "https://spreadsheets.google.com/feeds/list/1Yi3hkwCs5bIQvBjr87Zg9OHdxZ0njOzweEwzQ6vH9Wg/od6/public/values"

	def self.update_from_feed(feed_url,delay_interval=2.minutes)
	  if feed_url == "https://spreadsheets.google.com/feeds/list/1Yi3hkwCs5bIQvBjr87Zg9OHdxZ0njOzweEwzQ6vH9Wg/od6/public/values"
        feed = Feedjira::Feed.fetch_and_parse(feed_url)
  	  	unless feed.is_a?(Fixnum)
  	      add_entries(feed.entries)
  	    else
  	      puts feed.inspect
  	    end

  	  	loop do
  	  		sleep delay_interval
  	  		feed = Feedjira::Feed.update(feed_url)
  	  		add_entries(feed.new_entries) if feed.updated?
  	  	end
      else
        puts ".++++++++++++++..........................................."
      end
	end

  private


  def self.add_entries(entries)
  	entries.each do | entry |
      c = entry.updated.to_s
      unless exists? guid: entry.id+c
        b = entry.content
        content = b.split(',').map {|n| n.split(":").last }.map(&:to_f)

        ShareIndex.create!(
          all_share_index: content[0],
          twenty_share_index: content[1],
          published_at: entry.updated,
          guid: entry.id+c
        );
      end			  
  	end
  end
end
