class CreateTaggings < ActiveRecord::Migration
  def self.up
    create_table :taggings do |t|
      t.integer :tag_id
      t.string :target_type
      t.integer :target_id

      t.timestamps
    end
  end

  def self.down
    drop_table :taggings
  end
end
