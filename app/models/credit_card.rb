class CreditCard < ActiveRecord::Base
  has_many :taggings, :as => :target
  has_many :tags, :through => :taggings, :source => :tag, :conditions => "taggings.target_type = 'CreditCard'"
  has_many :comments, :as => :target
end
