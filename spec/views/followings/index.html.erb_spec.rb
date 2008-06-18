require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/followings/index.html.erb" do
  include FollowingsHelper
  
  before(:each) do
    following_98 = mock_model(Following)
    following_98.should_receive(:user_id).and_return("1")
    following_98.should_receive(:follower_id).and_return("1")
    following_99 = mock_model(Following)
    following_99.should_receive(:user_id).and_return("1")
    following_99.should_receive(:follower_id).and_return("1")

    assigns[:followings] = [following_98, following_99]
  end

  it "should render list of followings" do
    render "/followings/index.html.erb"
  end
end

