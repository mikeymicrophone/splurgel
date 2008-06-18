class Listing < ActiveRecord::Base
  belongs_to :product
  belongs_to :brand
  belongs_to :store
  belongs_to :user
  has_many :taggings, :as => :target
  has_many :tags, :through => :taggings, :source => :tag, :conditions => "taggings.target_type = 'Listing'"
  has_many :comments, :as => :target
end
