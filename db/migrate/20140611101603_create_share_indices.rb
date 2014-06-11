class CreateShareIndices < ActiveRecord::Migration
  def change
    create_table :share_indices do |t|
      t.float :all_share_index
      t.float :twenty_share_index

      t.timestamps
    end
  end
end
