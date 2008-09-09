class Price < ActiveRecord::Base
  belongs_to :offering
  has_many :taggings, :as => :target
  has_many :tags, :through => :taggings
  has_many :comments, :as => :target
  
  define_index do
    indexes tags(:name)
    indexes comments(:body)
  end
  
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
