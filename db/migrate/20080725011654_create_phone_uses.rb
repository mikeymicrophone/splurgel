class CreatePhoneUses < ActiveRecord::Migration
  def self.up
    create_table :phone_uses do |t|
      t.integer :phone_id
      t.integer :target_id
      t.string :target_type
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :phone_uses
  end
end
