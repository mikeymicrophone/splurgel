require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/purchases/show.html.erb" do
  include PurchasesHelper
  
  before(:each) do
    @purchase = mock_model(Purchase)
    @purchase.stub!(:user_id).and_return("1")
    @purchase.stub!(:offering_id).and_return("1")
    @purchase.stub!(:credit_card_id).and_return("1")
    @purchase.stub!(:address_id).and_return("1")
    @purchase.stub!(:approved).and_return(false)
    @purchase.stub!(:complete).and_return(false)

    assigns[:purchase] = @purchase
  end

  it "should render attributes in <p>" do
    render "/purchases/show.html.erb"
    response.should have_text(/als/)
    response.should have_text(/als/)
  end
end

