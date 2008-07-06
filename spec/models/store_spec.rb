require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Store do
  
  describe 'retrieving followers' do
    before do
      @franklin = Store.create :name => 'Franklin'
      @sammy = User.create :login => 'sammy', :email => 'halpert@gendle.com', :password => 'quire69', :password_confirmation => 'quire69'
      @sammy.activate!
      @sindacated = Group.create :name => 'sindacated'
      @simply = Location.create :name => 'simple'
      Following.create :follower => @sammy, :target => @franklin, :user_id => @sammy.id
      Following.create :follower => @sindacated, :target => @franklin
      Following.create :follower => @simply, :target => @franklin
    end
    
    it 'should be able to find its followers' do
      @franklin.followers.should_not be_nil
      @franklin.followers.first.should be_kind_of(User)
    end
    
    it 'should be able to find its following groups' do
      @franklin.follower_groups.should_not be_nil
      @franklin.follower_groups.first.should be_kind_of(Group)
    end
    
    it 'should be able to find its following locations' do
      @franklin.follower_locations.should_not be_nil
      @franklin.follower_locations.first.should be_kind_of(Location)
    end
  end
  
  describe 'validity' do
    before(:each) do
      @store = Store.new
    end

    it "should be valid" do
      @store.should be_valid
    end
  end
end
