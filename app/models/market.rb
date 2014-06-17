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
		def self.update_from_feed(feed_url,delay_interval=2.minutes)
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
	end

  private


  def self.add_entries(entries)
  	entries.each do | entry |
      c = entry.updated.to_s
      unless exists? guid: entry.id+c
        b = entry.content
        content = b.split(',').map {|n| n.split(":").last }.map(&:to_f)

        Market.create!(
          equity_turnover: content[0],
          market_capitalization: content[1],
          published_at: entry.updated,
          guid: entry.id+c
        );
      end			  
  	end
  end
end
