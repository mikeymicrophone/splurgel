class Tagging < ActiveRecord::Base
  belongs_to :tag
  belongs_to :target, :polymorphic => true
  # address, address_use, brand, city, comment, following, group, image, image_use, listing, location
  # membership, message, network, network_membership, offering, price, product, purchase, (schedule?)
  # state, store, (tag?), user, website, website_use
  belongs_to :address, :foreign_key => :target_id
  belongs_to :address_use, :foreign_key => :target_id
  belongs_to :brand, :foreign_key => :target_id
  belongs_to :city, :foreign_key => :target_id
  belongs_to :comment, :foreign_key => :target_id
  belongs_to :following, :foreign_key => :target_id
  belongs_to :group, :foreign_key => :target_id
  belongs_to :image, :foreign_key => :target_id
  belongs_to :image_use, :foreign_key => :target_id
  belongs_to :listing, :foreign_key => :target_id
  belongs_to :location, :foreign_key => :target_id
  belongs_to :membership, :foreign_key => :target_id
  belongs_to :message, :foreign_key => :target_id
  belongs_to :network, :foreign_key => :target_id
  belongs_to :network_membership, :foreign_key => :target_id
  belongs_to :offering, :foreign_key => :target_id
  belongs_to :price, :foreign_key => :target_id
  belongs_to :product, :foreign_key => :target_id
  belongs_to :purchase, :foreign_key => :target_id
  belongs_to :schedule, :foreign_key => :target_id
  belongs_to :state, :foreign_key => :target_id
  belongs_to :store, :foreign_key => :target_id
  belongs_to :tag, :foreign_key => :target_id
  belongs_to :user, :foreign_key => :target_id
  belongs_to :website, :foreign_key => :target_id
  belongs_to :website_use, :foreign_key => :target_id
  has_many :taggings, :as => :target
  has_many :tags, :through => :taggings, :source => :tag, :conditions => "taggings.target_type = 'Tagging'"
  has_many :website_uses, :as => :target
  has_many :websites, :through => :website_uses, :source => :website, :conditions => "website_uses.target_type = 'Tagging'"
  has_many :comments, :as => :target
  serialize :primary_photos, Array
  
  def tag_name
    tag.name
  end
  
  def name
    if target.respond_to?(:name)
      tag_name + ' on ' + target.name
    else
      tag_name + ' on ' + target.class.name.downcase
    end
  end
end
