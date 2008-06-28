class Price < ActiveRecord::Base
  belongs_to :offering
  has_many :taggings, :as => :target
  has_many :tags, :through => :taggings, :source => :tag, :conditions => "taggings.target_type = 'Price'"
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
  
  def brand
    product.brand
  end
end
