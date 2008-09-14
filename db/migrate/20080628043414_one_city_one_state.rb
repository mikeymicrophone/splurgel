class OneCityOneState < ActiveRecord::Migration
  def self.up
    remove_column :addresses, :city
    remove_column :addresses, :state
  end

  def self.down
    add_column :addresses, :city, :string
    add_column :addresses, :state, :string
  end
end
