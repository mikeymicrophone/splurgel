class Authorization < ActiveRecord::Base
  belongs_to :target, :polymorphic => true
  belongs_to :user
  belongs_to :authorizer, :class_name => 'User'

  # authorized to create locations if target_type is Store and authorization_type is 1
  # authorized to edit locations if target_type is Store and authorization_type is 2
  
  # authorized to create offerings if target_type is Location or Store and authorization_type is 10
  # authorized to edit offerings if target_type is Location or Store and authorization_type is 20

  def locations
    case target.class.name
    when 'Location'
      [target]
    when 'Store'
      target.locations
    else
      target.respond_to?(:locations) ? target.locations : []
    end
  end

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
  
  def self.type_hash
    {1 => 'create locations', 2 => 'edit locations', 10 => 'create offerings', 20 => 'edit offerings',
     'create locations' => 1, 'edit locations' => 2, 'create offerings' => 10, 'edit offerings' => 20}
  end
  
  def self.authorization_types(scope = nil)
    case scope
    when 'location', 'Location', :location
      [['create offerings', 10], ['edit offerings', 20]]
    when 'store', 'Store', :store
      [['create locations', 1], ['edit locations', 2], ['create offerings', 10], ['edit offerings', 20]]
    else
      [['create locations', 1], ['edit locations', 2], ['create offerings', 10], ['edit offerings', 20]]
    end
  end

  alias :to_create_location_of :to_create_location
  alias :to_edit_location_of :to_edit_location
  alias :to_create_offering_for :to_create_offering
  alias :to_edit_offering_for :to_edit_offering

end
