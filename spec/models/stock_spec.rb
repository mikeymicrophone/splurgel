require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Stock do
  before(:each) do
    @valid_attributes = {
      :offering_id => "1",
      :style_id => "1",
      :user_id => "1"
    }
  end

  it "should create a new instance given valid attributes" do
    Stock.create!(@valid_attributes)
  end
end
