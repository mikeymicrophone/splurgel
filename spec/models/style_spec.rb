require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Style do
  before(:each) do
    @valid_attributes = {
      :size => "value for size",
      :traits => "value for traits",
      :product_id => "1",
      :user_id => "1"
    }
  end

  it "should create a new instance given valid attributes" do
    Style.create!(@valid_attributes)
  end
end
