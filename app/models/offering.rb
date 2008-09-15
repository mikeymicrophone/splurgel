class Offering < ActiveRecord::Base
  belongs_to :product
  belongs_to :location
  has_many :stocks
  # has_one :store, :through => :location
  has_many :prices
  has_many :taggings, :as => :target
  has_many :tags, :through => :taggings
  has_many :website_uses, :as => :target
  has_many :websites, :through => :website_uses
  has_many :comments, :as => :target
  has_many :followings, :as => :target
  has_many :followers, :through => :followings, :source => :user, :conditions => "followings.target_type = 'Offering' and followings.follower_type = 'User'", :as => :target
  has_many :follower_groups, :through => :followings, :source => :group, :conditions => "followings.target_type = 'Offering' and followings.follower_type = 'Group'", :as => :target
  has_many :follower_locations, :through => :followings, :source => :location, :conditions => "followings.target_type = 'Offering' and followings.follower_type = 'Location'", :as => :target
  has_many :notices
  has_many :delivered_notices, :through => :notices
  serialize :primary_photos, Array
  after_create :notify_location
  
  define_index do
    indexes product(:name)
    indexes tags(:name)
    indexes comments(:body)
  end
  
  def notify_location
    location.make_known("#{product.name} by #{product.brand.name} is now available at #{store.name}.", self)
  end
  
  def notify_product
    product.make_known("now available in #{address.city.name} at #{store.name}.", self)
  end
  
  def price
    prices.select { |p| (p.end_date > Time.now) && (p.start_date.blank? || p.start_date < Time.now)  }.sort_by(&:point).first
  end
  
  def store
    location.store
  end
  
  def name
    nm = ''
    nm += product.name if product
    nm += ' at ' if product && location
    nm += location.name if location
  end
end
