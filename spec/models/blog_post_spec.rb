require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe BlogPost do
  before(:each) do
    @valid_attributes = {
      :blog_id => "1",
      :post_id => "1",
      :user_id => "1"
    }
  end

  it "should create a new instance given valid attributes" do
    BlogPost.create!(@valid_attributes)
  end
end
