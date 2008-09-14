class CardNumberIsString < ActiveRecord::Migration
  def self.up
    change_column :credit_cards, :card_number, :string
  end

  def self.down
    change_column :credit_cards, :card_number, :integer
  end
end
