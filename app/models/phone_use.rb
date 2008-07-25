class PhoneUse < ActiveRecord::Base
  belongs_to :phone
  belongs_to :user
  belongs_to :target, :polymorphic => :true
  belongs_to :phone_user, :class_name => 'User', :foreign_key => :target_id
  belongs_to :group, :foreign_key => :target_id
  belongs_to :brand, :foreign_key => :target_id
  belongs_to :store, :foreign_key => :target_id
  belongs_to :website, :foreign_key => :target_id
  belongs_to :city, :foreign_key => :target_id
  belongs_to :address, :foreign_key => :target_id

  def self.targets
    %w! User Group Brand Store Location Website City Address !
  end

  def name
    target.name + ' at ' + phone.number
  end
end
