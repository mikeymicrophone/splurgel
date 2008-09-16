class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipient, :class_name => 'User'
  has_many :taggings, :as => :target
  has_many :tags, :through => :taggings
  has_many :website_uses, :as => :target
  has_many :websites, :through => :website_uses
  has_many :comments, :as => :target
  belongs_to :reply, :class_name => 'Message'
  
  define_index do
    indexes :body
    indexes tags(:name), :as => :tags
    indexes comments(:body), :as => :comments
    indexds reply(:body), :as => :reply_body
  end
  
  def first_sentence
    sentence = body[/([^\.]*)/]
    sentence[0..230]
  end
  
  def name
    "#{user.login} to #{recipient.login}"
  end
end
