require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Purchase do
  before(:each) do
    @purchase = Purchase.new
  end

  it "should be valid" do
    @purchase.should be_valid
  end
end
