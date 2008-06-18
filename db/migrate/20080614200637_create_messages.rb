class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.text :body
      t.integer :user_id
      t.integer :reply_id
      t.datetime :read_on

      t.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end
