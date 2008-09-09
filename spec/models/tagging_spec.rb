require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Tagging do
  before(:each) do
    @tagging = Tagging.new
  end

  it "should be valid" do
    @tagging.should be_valid
  end
  
  # it 'should only object named by target_type' do
  #   @target = Brand.create(:name => 'Diesel')
  #   @city = City.create(:name => 'Sicily')
  #   @tagging.target_type = 'Brand'
  #   @tagging.target_id = @target.id
  #   @tagging.tag = Tag.create(:name => 'Italian')
  #   @tagging.save
  #   @tagging.brand.should == @target
  #   @tagging.city.should == @nil
  # end
end
