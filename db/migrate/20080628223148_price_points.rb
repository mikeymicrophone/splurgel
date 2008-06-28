class PricePoints < ActiveRecord::Migration
  def self.up
    add_column :prices, :point, :float
  end

  def self.down
    remove_column :prices, :point
  end
end
