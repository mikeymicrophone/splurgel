require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Offering do
  before(:each) do
    @offering = Offering.new
  end

  it "should be valid" do
    @offering.should be_valid
  end
  
  it "should know what store it is offered at" do
    @product = Product.create(:name => 'vest')
    @store = Store.create(:name => 'Target')
    @location = Location.create(:store => @store)
    @offering.product = @product
    @offering.location = @location
    @offering.save
    @offering.store.should == @store
  end
end
