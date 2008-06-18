class NetworkMembership < ActiveRecord::Base
  belongs_to :network
  belongs_to :user
  has_many :taggings, :as => :target
  has_many :tags, :through => :taggings, :source => :tag, :conditions => "taggings.target_type = 'NetworkMembership'"
  has_many :comments, :as => :target
end
