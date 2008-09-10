class CreateDeliveredNotices < ActiveRecord::Migration
  def self.up
    create_table :delivered_notices do |t|
      t.integer :notice_id
      t.integer :user_id
      t.datetime :read_at
      t.datetime :dismissed_at
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :delivered_notices
  end
end
