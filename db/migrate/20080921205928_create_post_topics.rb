class CreatePostTopics < ActiveRecord::Migration
  def self.up
    create_table :post_topics do |t|
      t.integer :post_id
      t.integer :target_id
      t.string :target_type
      t.integer :user_id
    
      t.timestamps
    end
  end

  def self.down
    drop_table :post_topics
  end
end
