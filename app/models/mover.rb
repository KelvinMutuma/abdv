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
	feed_url = "https://spreadsheets.google.com/feeds/list/1hb9O9MulweXASHaRzYbIOpRpkT7Mksx5xayfsUtv_8g/od6/public/values"

	def self.update_from_feed(feed_url,delay_interval=2.minutes)
	  	if feed_url == "https://spreadsheets.google.com/feeds/list/1ncyK8uXoeLobVkdiSKQcYJr2joK_uN5QSBB3814GKaw/od6/public/values"
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
        a = entry.content
        b = a.split(" ").last.split(",").join.to_i

        Mover.create!(
          mover: entry.title,
          volume: b,
          published_at: entry.updated,
          guid: entry.id+c
        );
      end			  
  	end
  end
end
