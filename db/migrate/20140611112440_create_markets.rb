class CreateMarkets < ActiveRecord::Migration
  def change
    create_table :markets do |t|
      t.float :equity_turnover
      t.float :market_capitalization

      t.timestamps
    end
  end
end
