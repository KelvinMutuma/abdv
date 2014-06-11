class AddcolumnstostockQuotes < ActiveRecord::Migration
  def change
  	add_column :stock_quotes, :yesterday, :float, default: 0.00
  	add_column :stock_quotes, :current, :float, default: 0.00
  	add_column :stock_quotes, :price_change, :float, default: 0.00
  	add_column :stock_quotes, :percentage_change, :float, default: 0.00
  	add_column :stock_quotes, :high, :float, default: 0.00
  	add_column :stock_quotes, :low, :float, default: 0.00
  end
end
