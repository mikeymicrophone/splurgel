class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
  has_many :taggings, :as => :target
  has_many :tags, :through => :taggings, :source => :tag, :conditions => "taggings.target_type = 'Membership'"
  has_many :comments, :as => :target
end
