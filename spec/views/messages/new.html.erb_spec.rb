require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/messages/new.html.erb" do
  include MessagesHelper
  
  before(:each) do
    @message = mock_model(Message)
    @message.stub!(:new_record?).and_return(true)
    @message.stub!(:body).and_return("MyText")
    @message.stub!(:user_id).and_return("1")
    @message.stub!(:reply_id).and_return("1")
    @message.stub!(:read_on).and_return(Time.now)
    assigns[:message] = @message
  end

  it "should render new form" do
    render "/messages/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", messages_path) do
      with_tag("textarea#message_body[name=?]", "message[body]")
    end
  end
end


