class Authorization < ActiveRecord::Base
  belongs_to :target, :polymorphic => true
  belongs_to :user
  belongs_to :authorizer, :class_name => 'User'

  # authorized to create locations if target_type is Store and authorization_type is 1
  # authorized to edit locations if target_type is Store and authorization_type is 2
  
  # authorized to create offerings if target_type is Location and authorization_type is 10
  # authorized to edit offerings if target_type is Location and authorization_type is 20

  def to_create_location(store)
    store = store.id if store.is_a?(Store)
    authorization_type == 1 && target_id == store
  end
  
  def to_edit_location(store)
    store = store.id if store.is_a?(Store)
    [1, 2].include?(authorization_type) && target_id == store
  end
  
  def to_create_offering(location)
    location = location.id if location.is_a?(Location)
    [1, 2, 10].include?(authorization_type) && target_id == location
  end
  
  def to_edit_offering(location)
    location = location.id if location.is_a?(Location)
    [1, 2, 10, 20].include?(authorization_type) && target_id == location
  end

  alias :to_create_location_of :to_create_location
  alias :to_edit_location_of :to_edit_location
  alias :to_create_offering_for :to_create_offering
  alias :to_edit_offering_for :to_edit_offering

end
