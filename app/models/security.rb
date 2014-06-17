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
        puts ".++++++++++++++NOT THE CORRECT URL+++++++++++++++++++."
      end
	end

  private


  def self.add_entries(entries)
  	entries.each do | entry |
      c = entry.updated.to_s
      unless exists? guid: entry.id+c
        b = entry.content
        content = b.split(',').map {|n| n.split(":").last }.map(&:to_f)

        d=Security.find_or_create_by(security: entry.title.capitalize )

        d.stock_quotes.create!(
          yesterday: content[0],
          current: content[1],
          price_change: content[2],
          percentage_change: content[3],
          high: content[4],
          low: content[5],
          published_at: entry.updated,
          guid: entry.id+c
        );
      end			  
  	end
  end
end
