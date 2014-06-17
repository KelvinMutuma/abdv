desc "Update Indices"
task :update_indices => :environment do 
	#@feed_url = params[:feed_url]
	feed_url = ENV["FEED_URL"]
    ShareIndex.update_from_feed(feed_url)
end