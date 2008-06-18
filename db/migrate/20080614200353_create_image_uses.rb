class CreateImageUses < ActiveRecord::Migration
  def self.up
    create_table :image_uses do |t|
      t.integer :image_id
      t.string :target_type
      t.integer :target_id

      t.timestamps
    end
  end

  def self.down
    drop_table :image_uses
  end
end
