desc "Update Changers"
task :update_changers => :environment do 
	#@feed_url = params[:feed_url]
	feed_url = ENV["FEED_URL"]
    Changer.update_from_feed(feed_url)
end