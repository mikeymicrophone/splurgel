require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe WebsiteUse do
  before(:each) do
    @website_use = WebsiteUse.new
  end

  it "should be valid" do
    @website_use.should be_valid
  end
end
