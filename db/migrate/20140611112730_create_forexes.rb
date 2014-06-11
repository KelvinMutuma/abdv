class CreateForexes < ActiveRecord::Migration
  def change
    create_table :forexes do |t|
      t.string :currency
      t.float :buy
      t.float :sell
      t.float :mean

      t.timestamps
    end
  end
end
