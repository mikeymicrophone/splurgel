class CreateNetworkMemberships < ActiveRecord::Migration
  def self.up
    create_table :network_memberships do |t|
      t.integer :user_id
      t.integer :network_id

      t.timestamps
    end
  end

  def self.down
    drop_table :network_memberships
  end
end
