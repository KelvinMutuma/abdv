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
    feed_url = "https://spreadsheets.google.com/feeds/list/1KsgFX_MtJLqDcOs8fcV4HLZ_gAKlU0NMQviEAl5Ar4M/od6/public/values"

	def self.update_from_feed(feed_url,delay_interval=2.minutes)
	  	if feed_url == "https://spreadsheets.google.com/feeds/list/1KsgFX_MtJLqDcOs8fcV4HLZ_gAKlU0NMQviEAl5Ar4M/od6/public/values"
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
        b = a.split(" ").last.to_f

        Forex.create!(
          currency: entry.title,
          mean: b,
          published_at: entry.updated,
          guid: entry.id+c
        );
      end			  
  	end
  end
end
