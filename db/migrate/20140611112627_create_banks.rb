class CreateBanks < ActiveRecord::Migration
  def change
    create_table :banks do |t|
      t.integer :volume
      t.float :high
      t.float :low
      t.float :war
      t.integer :window_borrowing

      t.timestamps
    end
  end
end
