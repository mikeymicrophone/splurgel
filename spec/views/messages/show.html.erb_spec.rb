require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/messages/show.html.erb" do
  include MessagesHelper
  
  before(:each) do
    @message = mock_model(Message)
    @message.stub!(:body).and_return("MyText")
    @message.stub!(:user_id).and_return("1")
    @message.stub!(:reply_id).and_return("1")
    @message.stub!(:read_on).and_return(Time.now)

    assigns[:message] = @message
  end

  it "should render attributes in <p>" do
    render "/messages/show.html.erb"
    response.should have_text(/MyText/)
  end
end

