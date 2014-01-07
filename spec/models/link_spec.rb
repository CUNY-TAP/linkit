require 'spec_helper'

describe Link do
  before(:each) do
  	@link = FactoryGirl.create(:link)
  end

  it "has a url" do
   @link.url.should be_present
  end

  it "cannot create a new link if not signed in yet" do
    visit "/"
      
    expect(page).to have_no_content "New"
  end

  # The positive and negative cases of this are also tested in the 
  # session_integration_tests_spec.rb file

  it "belongs to a user" do
    user = FactoryGirl.create(:user)
    user.links << @link
    @link.user.should == user
  end

  context "with comments" do
    before(:each) do
      @link = FactoryGirl.create(:link_with_comment)
    end

    it "has a score" do
      @link.score.should be_present
    end

    it "has a comment" do
      @link.comments.count.should == 1
    end

    it "updates its cumulative score when a comment is voted up" do
      comment = @link.comments.first
      comment2 = FactoryGirl.create(:comment)
      @link.comments << comment2
      
      comment.vote_up
      2.times {comment2.vote_up}    
    
      @link.save
      @link.reload ##this is necessary
    
      @link.score.should == 5

      ## This one is tricky. You'll have to have several lines of code here. 
      ## The idea is that a link with 2 comments, one of a score 2, the other of a score 3, 
      ## will have a composite score of 5.

      ## A hint is that you may want to leverage the after_save callback of the 
      ## comment method to maybe update the parent link. 
    end

    it "updates its cumulative score when a comment is voted down" do
      comment = @link.comments.first
      comment2 = FactoryGirl.create(:comment)
      @link.comments << comment2
      
      comment.vote_down #comment score = 0
      comment2.vote_down #comment2 score = 0
         
    
      @link.save
      @link.reload ##this is necessary
    
      @link.score.should == 0

      ## This one is tricky. You'll have to have several lines of code here. 
      ## The idea is that a link with 2 comments, one of a score 2, the other of a score 3, 
      ## will have a composite score of 5.

      ## A hint is that you may want to leverage the after_save callback of the 
      ## comment method to maybe update the parent link. 
    end
  end

end
