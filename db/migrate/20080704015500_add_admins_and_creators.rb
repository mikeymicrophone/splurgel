class AddAdminsAndCreators < ActiveRecord::Migration
  def self.up
    add_column :groups, :user_id, :integer
    add_column :stores, :user_id, :integer
    add_column :locations, :user_id, :integer
    add_column :schedules, :user_id, :integer
    add_column :locations, :administrator_id, :integer
    add_column :networks, :administrator_id, :integer
    add_column :followings, :user_id, :integer
    add_column :states, :user_id, :integer
    add_column :cities, :user_id, :integer
  end

  def self.down
    remove_column :groups, :user_id
    remove_column :stores, :user_id
    remove_column :locations, :user_id
    remove_column :schedules, :user_id
    remove_column :locations, :administrator_id
    remove_column :networks, :administrator_id
    remove_column :followings, :user_id
    remove_column :states, :user_id
    remove_column :cities, :user_id    
  end
end
