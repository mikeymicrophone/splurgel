class CreateCreditCards < ActiveRecord::Migration
  def self.up
    create_table :credit_cards do |t|
      t.integer :address_id
      t.integer :card_number
      t.integer :expiration_month
      t.integer :expiration_year
      t.integer :security_code
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :credit_cards
  end
end
