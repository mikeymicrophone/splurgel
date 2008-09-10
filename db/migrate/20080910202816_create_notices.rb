class CreateNotices < ActiveRecord::Migration
  def self.up
    create_table :notices do |t|
      t.text :body
      t.string :short_version
      t.string :target_type
      t.integer :target_id
      t.string :followed_type
      t.integer :followed_id
      t.string :secondary_targets
      t.integer :user_id
      t.string :private
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :notices
  end
end
