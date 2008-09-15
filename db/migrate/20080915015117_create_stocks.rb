class CreateStocks < ActiveRecord::Migration
  def self.up
    create_table :stocks do |t|
      t.integer :offering_id
      t.integer :style_id
      t.integer :user_id

      t.timestamps
    end
    
    remove_column :offerings, :stock
  end

  def self.down
    drop_table :stocks
    add_column :offerings, :stock, :string
  end
end
