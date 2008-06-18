class AddUserIds < ActiveRecord::Migration
  def self.up
    add_column :brands, :administrator_id, :integer
    add_column :brands, :user_id, :integer
    add_column :products, :user_id, :integer
    add_column :offerings, :user_id, :integer
    add_column :prices, :user_id, :integer
    add_column :tags, :user_id, :integer
    add_column :taggings, :user_id, :integer
    add_column :images, :user_id, :integer
    add_column :image_uses, :user_id, :integer
    add_column :website_uses, :user_id, :integer
    add_column :addresses, :user_id, :integer
  end

  def self.down
    remove_column :brands, :administrator_id
    remove_column :brands, :user_id
    remove_column :products, :user_id
    remove_column :offerings, :user_id
    remove_column :prices, :user_id
    remove_column :tags, :user_id
    remove_column :taggings, :user_id
    remove_column :images, :user_id
    remove_column :image_uses, :user_id
    remove_column :website_uses, :user_id
    remove_column :addresses, :user_id
  end
end
