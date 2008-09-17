class Price < ActiveRecord::Base
  belongs_to :offering
  has_many :taggings, :as => :target
  has_many :tags, :through => :taggings
  has_many :comments, :as => :target
  
  define_index do
    indexes tags(:name), :as => :tags
    indexes comments(:body), :as => :comments
    set_property :delta => true
  end
  
  def active?
    self == offering.price
  end
  
  def current?
    return false if start_date? && start_date > Time.now
    return false if end_date? && end_date < Time.now
    true
  end
  
  def not_started?
    start_date && start_date > Time.now
  end
  
  def finished?
    end_date && end_date < Time.now
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
  
  def name
    "#{product.name} for #{point} at #{location.name}"
  end
end
