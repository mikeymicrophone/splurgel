require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Notice do
  before(:each) do
    @valid_attributes = {
      :target_type => "value for target_type",
      :target_id => "1",
      :followed_type => "value for followed_type",
      :followed_id => "1",
      :secondary_targets => "value for secondary_targets",
      :user_id => "1",
      :private => "value for private",
      :created_at => Time.now,
      :updated_at => Time.now
    }
  end

  it "should create a new instance given valid attributes" do
    Notice.create!(@valid_attributes)
  end
end
