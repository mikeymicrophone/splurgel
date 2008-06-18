class Schedule < ActiveRecord::Base
  has_many :locations
  has_many :stores, :through => :locations
  has_many :taggings, :as => :target
  has_many :tags, :through => :taggings, :source => :tag, :conditions => "taggings.target_type = 'Schedule'"
  has_many :comments, :as => :target
end
