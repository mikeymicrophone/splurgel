class PricesHaveStartDate < ActiveRecord::Migration
  def self.up
    add_column :prices, :start_date, :datetime
  end

  def self.down
    remove_column :prices, :start_date
  end
end
