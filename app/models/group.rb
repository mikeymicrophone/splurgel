class Group < ActiveRecord::Base
  has_many :memberships
  has_many :users, :through => :memberships
  has_many :address_uses, :as => :target
  has_many :addresses, :through => :address_uses, :source => :address, :conditions => "address_uses.target_type = 'Group'"
  has_many :taggings, :as => :target
  has_many :tags, :through => :taggings
  has_many :phone_uses, :as => :target
  has_many :phones, :through => :phone_uses
  has_many :website_uses, :as => :target
  has_many :websites, :through => :website_uses
  has_many :comments, :as => :target
  has_many :followings, :as => :target
  has_many :followers, :through => :followings, :source => :user, :conditions => "followings.target_type = 'Group' and followings.follower_type = 'User'", :as => :target
  has_many :follower_groups, :through => :followings, :source => :group, :conditions => "followings.target_type = 'Group' and followings.follower_type = 'Group'", :as => :target
  has_many :follower_locations, :through => :followings, :source => :location, :conditions => "followings.target_type = 'Group' and followings.follower_type = 'Location'", :as => :target
  belongs_to :administrator, :class_name => 'User', :foreign_key => :administrator_id
  has_many :notices
  has_many :delivered_notices, :through => :notices
  serialize :primary_photos, Array
  
  define_index do
    indexes :name
    indexes tags(:name), :as => :tags
    indexes comments(:body), :as => :comments
    set_property :delta => true
  end
  
  def self.public_groups
    find :all, :conditions => ['group_type in (3, 4)']
  end
  
  def self.viewable
    u = ActiveRecord::Base.instance_variable_get('@current_user')
    u.nil? ? public_groups : (u.groups + u.administered_groups + public_groups).uniq
  end
  
  def self.group_types
    [['personal', 1], ['private', 2], ['unconsensual', 3], ['consensual', 4]]
  end
end
