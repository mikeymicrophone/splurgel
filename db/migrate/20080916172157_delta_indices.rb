class DeltaIndices < ActiveRecord::Migration
  def self.up
    add_column :addresses, :delta, :boolean
    add_column :address_uses, :delta, :boolean
    add_column :authorizations, :delta, :boolean
    add_column :brands, :delta, :boolean
    add_column :cities, :delta, :boolean
    add_column :comments, :delta, :boolean
    add_column :credit_cards, :delta, :boolean
    add_column :delivered_notices, :delta, :boolean
    add_column :followings, :delta, :boolean
    add_column :groups, :delta, :boolean
    add_column :images, :delta, :boolean
    add_column :image_uses, :delta, :boolean
    add_column :listings, :delta, :boolean
    add_column :locations, :delta, :boolean
    add_column :memberships, :delta, :boolean
    add_column :messages, :delta, :boolean
    add_column :networks, :delta, :boolean
    add_column :network_memberships, :delta, :boolean
    add_column :notices, :delta, :boolean
    add_column :offerings, :delta, :boolean
    add_column :phones, :delta, :boolean
    add_column :phone_uses, :delta, :boolean
    add_column :prices, :delta, :boolean
    add_column :products, :delta, :boolean
    add_column :schedules, :delta, :boolean
    add_column :states, :delta, :boolean
    add_column :stocks, :delta, :boolean
    add_column :stores, :delta, :boolean
    add_column :styles, :delta, :boolean
    add_column :tags, :delta, :boolean
    add_column :taggings, :delta, :boolean
    add_column :users, :delta, :boolean
    add_column :websites, :delta, :boolean
    add_column :website_uses, :delta, :boolean
  end

  def self.down
    remove_column :addresses, :delta
    remove_column :address_uses, :delta
    remove_column :authorizations, :delta
    remove_column :brands, :delta
    remove_column :cities, :delta
    remove_column :comments, :delta
    remove_column :credit_cards, :delta
    remove_column :delivered_notices, :delta
    remove_column :followings, :delta
    remove_column :groups, :delta
    remove_column :images, :delta
    remove_column :image_uses, :delta
    remove_column :listings, :delta
    remove_column :locations, :delta
    remove_column :memberships, :delta
    remove_column :messages, :delta
    remove_column :networks, :delta
    remove_column :network_memberships, :delta
    remove_column :notices, :delta
    remove_column :offerings, :delta
    remove_column :phones, :delta
    remove_column :phone_uses, :delta
    remove_column :prices, :delta
    remove_column :products, :delta
    remove_column :schedules, :delta
    remove_column :states, :delta
    remove_column :stocks, :delta
    remove_column :stores, :delta
    remove_column :styles, :delta
    remove_column :tags, :delta
    remove_column :taggings, :delta
    remove_column :users, :delta
    remove_column :websites, :delta
    remove_column :website_uses, :delta
  end
end
