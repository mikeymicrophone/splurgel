require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PostTopic do
  before(:each) do
    @valid_attributes = {
      :post_id => "1",
      :target_id => "1",
      :target_type => "value for target_type",
      :user_id => "1"
    }
  end

  it "should create a new instance given valid attributes" do
    PostTopic.create!(@valid_attributes)
  end
end
