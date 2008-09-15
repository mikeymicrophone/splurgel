class CreateStyles < ActiveRecord::Migration
  def self.up
    create_table :styles do |t|
      t.string :size
      t.string :traits
      t.integer :product_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :styles
  end
end
