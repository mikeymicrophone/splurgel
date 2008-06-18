class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.string :phone
      t.integer :store_id
      t.integer :schedule_id
      t.integer :address_id

      t.timestamps
    end
  end

  def self.down
    drop_table :locations
  end
end
