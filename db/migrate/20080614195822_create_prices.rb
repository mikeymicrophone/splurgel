class CreatePrices < ActiveRecord::Migration
  def self.up
    create_table :prices do |t|
      t.integer :offering_id
      t.boolean :sale
      t.datetime :end_date

      t.timestamps
    end
  end

  def self.down
    drop_table :prices
  end
end
