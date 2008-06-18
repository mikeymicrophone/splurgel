class FollowAnything < ActiveRecord::Migration
  def self.up
    rename_column :followings, :user_id, :target_id
    add_column :followings, :target_type, :string
    add_column :followings, :follower_type, :string
  end

  def self.down
    rename_column :followings, :target_id, :user_id
    remove_column :followings, :target_type
    remove_column :followings, :follower_type
  end
end
