require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/comments/show.html.erb" do
  include CommentsHelper
  
  before(:each) do
    @comment = mock_model(Comment)
    @comment.stub!(:body).and_return("MyText")
    @comment.stub!(:user_id).and_return("1")
    @comment.stub!(:reply_id).and_return("1")
    @comment.stub!(:target_type).and_return("MyString")
    @comment.stub!(:target_id).and_return("1")

    assigns[:comment] = @comment
  end

  it "should render attributes in <p>" do
    render "/comments/show.html.erb"
    response.should have_text(/MyText/)
    response.should have_text(/MyString/)
  end
end

