class OneCityOneState < ActiveRecord::Migration
  def self.up
    remove_column :addresses, :city
    remove_column :addresses, :state
  end

  def self.down
    create_column :addresses, :city, :string
    create_column :addresses, :state, :string
  end
end
