class WebsiteUse < ActiveRecord::Base
  belongs_to :website
  belongs_to :target, :polymorphic => true
  # brand, city, comment, group, image, location, message, network, offering, product, state, store, tagging, user
  has_many :taggings, :as => :target
  has_many :tags, :through => :taggings
  has_many :comments, :as => :target
  after_create :notify_website, :notify_target
  
  def notify_website
    website.make_known("#{target.name} is at #{website.href}.", [self, target])
  end
  
  def notify_target
    target.make_known("#{website.href} is in play.", [self, website])
  end

  def self.targets
    %w! brand city comment group image location message network offering product state store tagging user !
  end
  
  def name
    if website.name.blank?
      website.href
    else
      website.name
    end + ' on ' +
    if target.respond_to?(:name)
      target.name
    else
      target.class.name.downcase
    end
  end
end
