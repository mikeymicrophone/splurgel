class CreatePurchases < ActiveRecord::Migration
  def self.up
    create_table :purchases do |t|
      t.integer :user_id
      t.integer :offering_id
      t.integer :credit_card_id
      t.integer :address_id
      t.boolean :approved
      t.boolean :complete

      t.timestamps
    end
  end

  def self.down
    drop_table :purchases
  end
end
