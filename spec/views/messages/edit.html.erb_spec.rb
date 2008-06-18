require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/messages/edit.html.erb" do
  include MessagesHelper
  
  before do
    @message = mock_model(Message)
    @message.stub!(:body).and_return("MyText")
    @message.stub!(:user_id).and_return("1")
    @message.stub!(:reply_id).and_return("1")
    @message.stub!(:read_on).and_return(Time.now)
    assigns[:message] = @message
  end

  it "should render edit form" do
    render "/messages/edit.html.erb"
    
    response.should have_tag("form[action=#{message_path(@message)}][method=post]") do
      with_tag('textarea#message_body[name=?]', "message[body]")
    end
  end
end


