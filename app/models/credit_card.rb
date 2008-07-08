class CreditCard < ActiveRecord::Base
  has_many :taggings, :as => :target
  has_many :tags, :through => :taggings
  has_many :comments, :as => :target
end
