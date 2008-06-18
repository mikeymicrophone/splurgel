require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/credit_cards/show.html.erb" do
  include CreditCardsHelper
  
  before(:each) do
    @credit_card = mock_model(CreditCard)
    @credit_card.stub!(:address_id).and_return("1")
    @credit_card.stub!(:card_number).and_return("1")
    @credit_card.stub!(:expiration_month).and_return("1")
    @credit_card.stub!(:expiration_year).and_return("1")
    @credit_card.stub!(:security_code).and_return("1")
    @credit_card.stub!(:user_id).and_return("1")

    assigns[:credit_card] = @credit_card
  end

  it "should render attributes in <p>" do
    render "/credit_cards/show.html.erb"
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/1/)
  end
end

