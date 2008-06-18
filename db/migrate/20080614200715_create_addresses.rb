class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.string :latitude
      t.string :longitude
      t.string :name
      t.string :alternate_names
      t.string :street
      t.string :street2
      t.string :city
      t.string :state
      t.integer :city_id
      t.integer :state_id
      t.integer :zip

      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end
