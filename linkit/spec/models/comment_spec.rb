require 'spec_helper'

describe Comment do
  before(:each) do
  	@comment = FactoryGirl.create(:comment)
  end

  it "belongs to a link" do

    link = FactoryGirl.create(:link)
    link.comments << @comment
    @comment.link.should be_present
  end

end
