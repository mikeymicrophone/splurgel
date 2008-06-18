require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Comment do
  before(:each) do
    @comment = Comment.new
  end

  it "should be valid" do
    @comment.should be_valid
  end
end
