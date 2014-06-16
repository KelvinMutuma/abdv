desc "Update Stock_Quotes"
task :update_stock_quotes => :environment do 
	#@feed_url = params[:feed_url]
	feed_url = ENV["FEED_URL"]
    StockQuote.update_from_feed(feed_url)
end