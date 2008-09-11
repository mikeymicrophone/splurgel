class Website < ActiveRecord::Base
  belongs_to :user
  has_many :taggings, :as => :target
  has_many :tags, :through => :taggings
  has_many :comments, :as => :target
  has_many :phone_uses, :as => :target
  has_many :phones, :through => :phone_uses
  has_many :brands, :through => :website_uses, :source => :brand, :conditions => "websitee_uses.target_type = 'Brand'"
  has_many :cities, :through => :website_uses, :source => :city, :conditions => "website_uses.target_type = 'City'"
  has_many :aided_comments, :through => :website_uses, :source => :comment, :conditions => "website_uses.target_type = 'Comment'"
  has_many :groups, :through => :website_uses, :source => :group, :conditions => "website_uses.target_type = 'Group'"
  has_many :images, :through => :website_uses, :source => :image, :conditions => "website_uses.target_type = 'Image'"
  has_many :locations, :through => :website_uses, :source => :location, :conditions => "website_uses.target_type = 'Location'"
  has_many :messages, :through => :website_uses, :source => :message, :conditions => "website_uses.target_type = 'Message'"
  has_many :networks, :through => :website_uses, :source => :network, :conditions => "website_uses.target_type = 'Network'"
  has_many :offerings, :through => :website_uses, :source => :offering, :conditions => "website_uses.target_type = 'Offering'"
  has_many :products, :through => :website_uses, :source => :product, :conditions => "website_uses.target_type = 'Product'"
  has_many :states, :through => :website_uses, :source => :state, :conditions => "website_uses.target_type = 'State'"
  has_many :stores, :through => :website_uses, :source => :store, :conditions => "website_uses.target_type = 'Store'"
  has_many :aided_taggings, :through => :website_uses, :source => :tagging, :conditions => "website_uses.target_type = 'Tagging'"
  has_many :users, :through => :website_uses, :source => :user, :conditions => "website_uses.target_type = 'User'"
  has_many :followings, :as => :target
  has_many :followers, :through => :followings, :source => :user, :conditions => "followings.target_type = 'Website' and followings.follower_type = 'User'", :as => :target
  has_many :follower_groups, :through => :followings, :source => :group, :conditions => "followings.target_type = 'Website' and followings.follower_type = 'Group'", :as => :target
  has_many :follower_locations, :through => :followings, :source => :location, :conditions => "followings.target_type = 'Website' and followings.follower_type = 'Location'", :as => :target
  has_many :notices
  has_many :delivered_notices, :through => :notices
  serialize :primary_photos, Array
  
  define_index do
    indexes :name
    indexes :href
    indexes tags(:name)
    indexes comments(:body)
    indexes brands(:name)
    indexes cities(:name)
    indexes aided_comments(:body)
    indexes groups(:name)
    indexes networks(:name)
    indexes products(:name)
    indexes states(:name)
    indexes stores(:name)
  end
  
  def is_used_by entity
    WebsiteUse.create(:website_id => id, :target_id => entity.id, :target_type => entity.class.name) unless WebsiteUse.find_by_target_id_and_target_type_and_website_id(entity.id, entity.class.name, id)
  end
end
