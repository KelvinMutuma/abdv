desc "Update Markets"
task :update_markets => :environment do 
	#@feed_url = params[:feed_url]
	feed_url = ENV["FEED_URL"]
    Market.update_from_feed(feed_url)
end