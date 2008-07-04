class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipient, :class_name => 'User', :foreign_key => :recipient_id
  has_many :taggings, :as => :target
  has_many :tags, :through => :taggings, :source => :tag, :conditions => "taggings.target_type = 'Message'"
  has_many :website_uses, :as => :target
  has_many :websites, :through => :website_uses, :source => :website, :conditions => "website_uses.target_type = 'Message'"
  has_many :comments, :as => :target
  belongs_to :reply, :class_name => 'Message'
  
  def first_sentence
    sentence = body[/([^\.]*)/]
    sentence[0..230]
  end
end
