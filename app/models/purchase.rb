class Purchase < ActiveRecord::Base
  belongs_to :user
  belongs_to :offering
  belongs_to :credit_card
  belongs_to :address
  has_many :taggings, :as => :target
  has_many :tags, :through => :taggings, :source => :tag, :conditions => "taggings.target_type = 'Purchase'"
  has_many :comments, :as => :target
  
  def product
    offering.product
  end
  
  def location
    offering.location
  end
  
  def store
    location.store
  end
end
