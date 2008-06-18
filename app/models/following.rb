class Following < ActiveRecord::Base
  belongs_to :follower, :polymorphic => true
  # group, user, location
  belongs_to :target, :polymorphic => true
  # brand, group, location, offering (price come down), product (who buys it), store, user, website
  has_many :taggings, :as => :target
  has_many :tags, :through => :taggings, :source => :tag, :conditions => "taggings.target_type = 'Following'"
  has_many :comments, :as => :target
end
