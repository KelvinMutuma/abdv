class CreateChangers < ActiveRecord::Migration
  def change
    create_table :changers do |t|
      t.string :security
      t.float :price
      t.float :percentage_change

      t.timestamps
    end
  end
end
