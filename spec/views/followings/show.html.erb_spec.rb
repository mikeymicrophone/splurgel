require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/followings/show.html.erb" do
  include FollowingsHelper
  
  before(:each) do
    @following = mock_model(Following)
    @following.stub!(:user_id).and_return("1")
    @following.stub!(:follower_id).and_return("1")

    assigns[:following] = @following
  end

  it "should render attributes in <p>" do
    render "/followings/show.html.erb"
  end
end

