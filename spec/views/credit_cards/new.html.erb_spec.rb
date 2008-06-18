require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/credit_cards/new.html.erb" do
  include CreditCardsHelper
  
  before(:each) do
    @credit_card = mock_model(CreditCard)
    @credit_card.stub!(:new_record?).and_return(true)
    @credit_card.stub!(:address_id).and_return("1")
    @credit_card.stub!(:card_number).and_return("1")
    @credit_card.stub!(:expiration_month).and_return("1")
    @credit_card.stub!(:expiration_year).and_return("1")
    @credit_card.stub!(:security_code).and_return("1")
    @credit_card.stub!(:user_id).and_return("1")
    assigns[:credit_card] = @credit_card
  end

  it "should render new form" do
    render "/credit_cards/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", credit_cards_path) do
      with_tag("input#credit_card_card_number[name=?]", "credit_card[card_number]")
      with_tag("input#credit_card_expiration_month[name=?]", "credit_card[expiration_month]")
      with_tag("input#credit_card_expiration_year[name=?]", "credit_card[expiration_year]")
      with_tag("input#credit_card_security_code[name=?]", "credit_card[security_code]")
    end
  end
end


