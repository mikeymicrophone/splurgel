class PhoneUserId < ActiveRecord::Migration
  def self.up
    add_column :phones, :user_id, :integer
  end

  def self.down
    remove_column :phones, :user_id
  end
end
