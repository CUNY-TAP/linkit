require 'spec_helper'

describe Comment do
  before (:each) do
  	@comment = FactoryGirl.create(:comment)
  end

  it "should have a text" do
  	@comment.text.should be_present
  end

  it "should start with no score" do
  	@comment.score.should == 0
  end

  it "should increase it's score" do 
  	@comment.voteUp
  	@comment.score.should be == 1
  end

  it "should decrease it's score" do
  	@comment.voteDown
  	@comment.score.should be == -1
  end
  
end
