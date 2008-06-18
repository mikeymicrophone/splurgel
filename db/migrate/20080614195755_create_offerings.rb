class CreateOfferings < ActiveRecord::Migration
  def self.up
    create_table :offerings do |t|
      t.integer :product_id
      t.integer :location_id
      t.string :stock

      t.timestamps
    end
  end

  def self.down
    drop_table :offerings
  end
end
