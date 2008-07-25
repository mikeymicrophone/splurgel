class CreatePhones < ActiveRecord::Migration
  def self.up
    create_table :phones do |t|
      t.string :number
      t.timestamps
    end
    
    remove_column :brands, :phone
    remove_column :locations, :phone
    add_column :locations, :primary_phone_id, :integer
    remove_column :users, :phone
  end

  def self.down
    drop_table :phones
  end
end
