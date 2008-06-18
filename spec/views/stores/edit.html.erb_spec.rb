require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/stores/edit.html.erb" do
  include StoresHelper
  
  before do
    @store = mock_model(Store)
    @store.stub!(:name).and_return("MyString")
    @store.stub!(:administrator_id).and_return("1")
    @store.stub!(:primary_image_id).and_return("1")
    assigns[:store] = @store
  end

  it "should render edit form" do
    render "/stores/edit.html.erb"
    
    response.should have_tag("form[action=#{store_path(@store)}][method=post]") do
      with_tag('input#store_name[name=?]', "store[name]")
    end
  end
end


