class CreateStockQuotes < ActiveRecord::Migration
  def change
    create_table :stock_quotes do |t|
      t.references :security, index: true

      t.timestamps
    end
  end
end
