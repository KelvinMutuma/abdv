class CreateMovers < ActiveRecord::Migration
  def change
    create_table :movers do |t|
      t.string :mover
      t.integer :volume

      t.timestamps
    end
  end
end
