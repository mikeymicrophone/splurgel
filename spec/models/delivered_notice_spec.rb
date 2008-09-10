require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe DeliveredNotice do
  before(:each) do
    @valid_attributes = {
      :notice_id => "1",
      :user_id => "1",
      :read_at => Time.now,
      :dismissed_at => Time.now,
      :created_at => Time.now,
      :updated_at => Time.now
    }
  end

  it "should create a new instance given valid attributes" do
    DeliveredNotice.create!(@valid_attributes)
  end
end
