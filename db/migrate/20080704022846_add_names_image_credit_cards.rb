class AddNamesImageCreditCards < ActiveRecord::Migration
  def self.up
    add_column :credit_cards, :name, :string
    add_column :images, :name, :string
  end

  def self.down
    remove_column :credit_cards, :name
    remove_column :credit_cards, :name
  end
end
