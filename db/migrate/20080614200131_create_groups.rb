class CreateGroups < ActiveRecord::Migration
  def self.up
    create_table :groups do |t|
      t.string :name
      t.integer :administrator_id
      t.integer :group_type

      t.timestamps
    end
  end

  def self.down
    drop_table :groups
  end
end
