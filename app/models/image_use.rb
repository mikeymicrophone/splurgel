class ImageUse < ActiveRecord::Base
  belongs_to :image
  belongs_to :target, :polymorphic => true
  # address, brand, city, comment, group, listing(?), location, offering, product, state, store, tagging(?), user, website
  belongs_to :brand, :class_name => 'Brand', :foreign_key => 'target_id'
  has_many :taggings, :as => :target
  has_many :tags, :through => :taggings, :source => :tag, :conditions => "taggings.target_type = 'ImageUse'"
  has_many :comments, :as => :target
  
  def self.targets
    ['Address', 'Brand', 'City', 'Comment', 'Group', 'Listing', 'Location', 'Offering', 'Product', 'State', 'Store', 'Tagging', 'User', 'Website']
  end
end
