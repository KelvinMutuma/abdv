class Addcolstoall < ActiveRecord::Migration
  def change
  	add_column :share_indices, :guid, :string
  	add_column :share_indices, :published_at, :datetime
  	add_column :markets, :guid, :string
  	add_column :markets, :published_at, :datetime
  	add_column :stock_quotes, :guid, :string
  	add_column :stock_quotes, :published_at, :datetime
  	add_column :movers, :guid, :string
  	add_column :movers, :published_at, :datetime
  	add_column :forexes, :guid, :string
  	add_column :forexes, :published_at, :datetime
  	add_column :banks, :guid, :string
  	add_column :banks, :published_at, :datetime
  	add_column :changers, :guid, :string
  	add_column :changers, :published_at, :datetime
  end
end
