require 'digest/sha1'

class User < ActiveRecord::Base
  has_many :listings
  has_many :network_memberships
  has_many :networks, :through => :network_memberships
  has_many :memberships
  has_many :groups, :through => :memberships
  has_many :comments
  has_many :address_uses, :as => :target
  has_many :addresses, :through => :address_uses, :source => :address, :conditions => "address_uses.target_type = 'User'"
  has_many :taggings, :as => :target
  has_many :tags, :through => :taggings, :source => :tag, :conditions => "taggings.target_type = 'User'"
  has_many :website_uses, :as => :target
  has_many :websites, :through => :website_uses, :source => :website, :conditions => "website_uses.target_type = 'User'"
  has_many :comments, :as => :target
  has_many :followings, :as => :target
  has_many :followers, :through => :followings, :source => :target, :conditions => "followings.target_type = 'User' and followings.follower_type = 'User'", :as => :target
  has_many :follower_groups, :through => :followings, :source => :group, :conditions => "followings.target_type = 'User' and followings.follower_type = 'Group'", :as => :target
  has_many :follower_locations, :through => :followings, :source => :location, :conditions => "followings.target_type = 'User' and followings.follower_type = 'Location'", :as => :target
  has_many :incoming_messages, :class_name => 'Message', :foreign_key => :recipient_id
  
  include Authentication
  include Authentication::ByPassword
  include Authentication::ByCookieToken

  validates_presence_of     :login
  validates_length_of       :login,    :within => 3..40
  validates_uniqueness_of   :login,    :case_sensitive => false
  validates_format_of       :login,    :with => RE_LOGIN_OK, :message => MSG_LOGIN_BAD

  validates_format_of       :name,     :with => RE_NAME_OK,  :message => MSG_NAME_BAD, :allow_nil => true
  validates_length_of       :name,     :maximum => 100

  validates_presence_of     :email
  validates_length_of       :email,    :within => 6..100 #r@a.wk
  validates_uniqueness_of   :email,    :case_sensitive => false
  validates_format_of       :email,    :with => RE_EMAIL_OK, :message => MSG_EMAIL_BAD

  before_create :make_activation_code 

  # HACK HACK HACK -- how to do attr_accessible from here?
  # prevents a user from submitting a crafted form that bypasses activation
  # anything else you want your user to change should be added here.
  attr_accessible :login, :email, :name, :password, :password_confirmation, :primary_address_id, :persona, :phone, :hobbies, :interests, :primary_address_id


  # Activates the user in the database.
  def activate!
    @activated = true
    self.activated_at = Time.now.utc
    self.activation_code = nil
    save(false)
  end

  def active?
    # the existence of an activation code means they have not activated yet
    activation_code.nil?
  end

  # Authenticates a user by their login name and unencrypted password.  Returns the user or nil.
  #
  # uff.  this is really an authorization, not authentication routine.  
  # We really need a Dispatch Chain here or something.
  # This will also let us return a human error message.
  #
  def self.authenticate(login, password)
    u = find :first, :conditions => ['login = ? and activated_at IS NOT NULL', login] # need to get the salt
    u && u.authenticated?(password) ? u : nil
  end

  protected
    
    def make_activation_code
        self.activation_code = self.class.make_token
    end


end
