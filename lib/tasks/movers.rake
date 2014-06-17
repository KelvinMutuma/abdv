desc "Update Movers"
task :update_movers => :environment do 
	#@feed_url = params[:feed_url]
	feed_url = ENV["FEED_URL"]
    Mover.update_from_feed(feed_url)
end