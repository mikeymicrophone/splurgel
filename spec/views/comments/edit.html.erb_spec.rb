require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/comments/edit.html.erb" do
  include CommentsHelper
  
  before do
    @comment = mock_model(Comment)
    @comment.stub!(:body).and_return("MyText")
    @comment.stub!(:user_id).and_return("1")
    @comment.stub!(:reply_id).and_return("1")
    @comment.stub!(:target_type).and_return("MyString")
    @comment.stub!(:target_id).and_return("1")
    assigns[:comment] = @comment
  end

  it "should render edit form" do
    render "/comments/edit.html.erb"
    
    response.should have_tag("form[action=#{comment_path(@comment)}][method=post]") do
      with_tag('textarea#comment_body[name=?]', "comment[body]")
      with_tag('input#comment_target_type[name=?]', "comment[target_type]")
    end
  end
end


