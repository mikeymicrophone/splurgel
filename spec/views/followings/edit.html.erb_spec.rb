require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/followings/edit.html.erb" do
  include FollowingsHelper
  
  before do
    @following = mock_model(Following)
    @following.stub!(:user_id).and_return("1")
    @following.stub!(:follower_id).and_return("1")
    assigns[:following] = @following
  end

  it "should render edit form" do
    render "/followings/edit.html.erb"
    
    response.should have_tag("form[action=#{following_path(@following)}][method=post]") do
    end
  end
end


