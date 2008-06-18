require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/purchases/new.html.erb" do
  include PurchasesHelper
  
  before(:each) do
    @purchase = mock_model(Purchase)
    @purchase.stub!(:new_record?).and_return(true)
    @purchase.stub!(:user_id).and_return("1")
    @purchase.stub!(:offering_id).and_return("1")
    @purchase.stub!(:credit_card_id).and_return("1")
    @purchase.stub!(:address_id).and_return("1")
    @purchase.stub!(:approved).and_return(false)
    @purchase.stub!(:complete).and_return(false)
    assigns[:purchase] = @purchase
  end

  it "should render new form" do
    render "/purchases/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", purchases_path) do
      with_tag("input#purchase_approved[name=?]", "purchase[approved]")
      with_tag("input#purchase_complete[name=?]", "purchase[complete]")
    end
  end
end


