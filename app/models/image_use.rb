class ImageUse < ActiveRecord::Base
  belongs_to :image
  belongs_to :target, :polymorphic => true
  # address, brand, city, comment, group, listing(?), location, offering, product, state, store, tagging(?), user, website
  belongs_to :brand, :class_name => 'Brand', :foreign_key => 'target_id'
  has_many :taggings, :as => :target
  has_many :tags, :through => :taggings
  has_many :comments, :as => :target
  
  def self.targets
    ['Address', 'Brand', 'City', 'Comment', 'Group', 'Listing', 'Location', 'Offering', 'Product', 'State', 'Store', 'Tagging', 'User', 'Website']
  end
  
  def primary?
    target && target.respond_to?(:primary_photos) && target.primary_photos && target.primary_photos.include?(image_id)
  end
  
  def name
    "image #{image_id} for #{target_type.downcase} #{target_id}"
  end
end
