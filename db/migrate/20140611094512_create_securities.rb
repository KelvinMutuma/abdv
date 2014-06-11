class CreateSecurities < ActiveRecord::Migration
  def change
    create_table :securities do |t|
      t.string :security
      t.string :security_code
      t.string :category

      t.timestamps
    end
    add_index :securities, :security, unique: true
    add_index :securities, [:category, :security_code]    
  end
end
