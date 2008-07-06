class PrimaryPhotoCaching < ActiveRecord::Migration
  def self.up
    add_column :addresses, :primary_photos, :string
    add_column :brands, :primary_photos, :string
    add_column :cities, :primary_photos, :string
    add_column :comments, :primary_photos, :string
    add_column :groups, :primary_photos, :string
    add_column :listings, :primary_photos, :string
    add_column :locations, :primary_photos, :string
    add_column :offerings, :primary_photos, :string
    add_column :products, :primary_photos, :string
    add_column :states, :primary_photos, :string
    add_column :stores, :primary_photos, :string
    add_column :taggings, :primary_photos, :string
    add_column :users, :primary_photos, :string
    add_column :websites, :primary_photos, :string
  end

  def self.down
    remove_column :addresses, :primary_photos
    remove_column :brands, :primary_photos
    remove_column :cities, :primary_photos
    remove_column :comments, :primary_photos
    remove_column :groups, :primary_photos
    remove_column :listings, :primary_photos
    remove_column :locations, :primary_photos
    remove_column :offerings, :primary_photos
    remove_column :products, :primary_photos
    remove_column :states, :primary_photos
    remove_column :stores, :primary_photos
    remove_column :taggings, :primary_photos
    remove_column :users, :primary_photos
    remove_column :websites, :primary_photos    
  end
end
