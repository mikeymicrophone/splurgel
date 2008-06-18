require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/credit_cards/index.html.erb" do
  include CreditCardsHelper
  
  before(:each) do
    credit_card_98 = mock_model(CreditCard)
    credit_card_98.should_receive(:address_id).and_return("1")
    credit_card_98.should_receive(:card_number).and_return("1")
    credit_card_98.should_receive(:expiration_month).and_return("1")
    credit_card_98.should_receive(:expiration_year).and_return("1")
    credit_card_98.should_receive(:security_code).and_return("1")
    credit_card_98.should_receive(:user_id).and_return("1")
    credit_card_99 = mock_model(CreditCard)
    credit_card_99.should_receive(:address_id).and_return("1")
    credit_card_99.should_receive(:card_number).and_return("1")
    credit_card_99.should_receive(:expiration_month).and_return("1")
    credit_card_99.should_receive(:expiration_year).and_return("1")
    credit_card_99.should_receive(:security_code).and_return("1")
    credit_card_99.should_receive(:user_id).and_return("1")

    assigns[:credit_cards] = [credit_card_98, credit_card_99]
  end

  it "should render list of credit_cards" do
    render "/credit_cards/index.html.erb"
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", "1", 2)
  end
end

