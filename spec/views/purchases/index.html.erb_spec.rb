require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/purchases/index.html.erb" do
  include PurchasesHelper
  
  before(:each) do
    purchase_98 = mock_model(Purchase)
    purchase_98.should_receive(:user_id).and_return("1")
    purchase_98.should_receive(:offering_id).and_return("1")
    purchase_98.should_receive(:credit_card_id).and_return("1")
    purchase_98.should_receive(:address_id).and_return("1")
    purchase_98.should_receive(:approved).and_return(false)
    purchase_98.should_receive(:complete).and_return(false)
    purchase_99 = mock_model(Purchase)
    purchase_99.should_receive(:user_id).and_return("1")
    purchase_99.should_receive(:offering_id).and_return("1")
    purchase_99.should_receive(:credit_card_id).and_return("1")
    purchase_99.should_receive(:address_id).and_return("1")
    purchase_99.should_receive(:approved).and_return(false)
    purchase_99.should_receive(:complete).and_return(false)

    assigns[:purchases] = [purchase_98, purchase_99]
  end

  it "should render list of purchases" do
    render "/purchases/index.html.erb"
    response.should have_tag("tr>td", false, 2)
    response.should have_tag("tr>td", false, 2)
  end
end

