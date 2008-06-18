class CreateStores < ActiveRecord::Migration
  def self.up
    create_table :stores do |t|
      t.string :name
      t.integer :administrator_id
      t.integer :primary_image_id

      t.timestamps
    end
  end

  def self.down
    drop_table :stores
  end
end
