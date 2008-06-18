class CreateNetworks < ActiveRecord::Migration
  def self.up
    create_table :networks do |t|
      t.string :name
      t.integer :city_id
      t.integer :state_id

      t.timestamps
    end
  end

  def self.down
    drop_table :networks
  end
end
