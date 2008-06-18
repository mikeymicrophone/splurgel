class CreateAddressUses < ActiveRecord::Migration
  def self.up
    create_table :address_uses do |t|
      t.string :target_type
      t.integer :target_id
      t.integer :address_id
      t.integer :user_id

      t.timestamps
    end
    add_column :networks, :user_id, :integer
  end

  def self.down
    drop_table :address_uses
    remove_column :networks, :user_id
  end
end
