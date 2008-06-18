require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/followings/new.html.erb" do
  include FollowingsHelper
  
  before(:each) do
    @following = mock_model(Following)
    @following.stub!(:new_record?).and_return(true)
    @following.stub!(:user_id).and_return("1")
    @following.stub!(:follower_id).and_return("1")
    assigns[:following] = @following
  end

  it "should render new form" do
    render "/followings/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", followings_path) do
    end
  end
end


