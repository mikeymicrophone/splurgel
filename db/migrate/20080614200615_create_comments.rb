class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.text :body
      t.integer :user_id
      t.integer :reply_id
      t.string :target_type
      t.integer :target_id

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
