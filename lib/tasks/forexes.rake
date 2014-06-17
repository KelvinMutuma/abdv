desc "Update Forexes"
task :update_forexes => :environment do 
	#@feed_url = params[:feed_url]
	feed_url = ENV["FEED_URL"]
    Forex.update_from_feed(feed_url)
end