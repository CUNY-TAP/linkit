require 'spec_helper'

describe "links" do
  before(:each) do
     @link = FactoryGirl.create(:link)
  end

  it "has a url" do
    @link.url.should be_present
  end

  it "has a score" do 
    @link.score.should be_present
  end

  it "belongs to a user" do
    user = FactoryGirl.create(:user)
    user.links << @link
    @link.user.should == user
  end

  it "displays all the links" do
    visit "/links"

    within("h1") do
      expect(page).to have_content "All links"
    end
    within(".table") do
      expect(page).to have_content "cool link"
    end
  end

  it "requires login to create new links" do
    visit "/links"
    click_link "New"  	

    expect(page).to have_content "You need to sign in or sign up before continuing."
  end

  context "with comments" do
    before(:each) do
      @link = FactoryGirl.create(:link_with_comment)
    end

    it "has a comment" do 
      @link.comments.should be_present
    end


    it "updates its cumulative score when a comment gets a score" do

      @link.comments.first.vote_up
      @link.comments.first.save

      comment2 = FactoryGirl.create(:comment)
      2.times{
        comment2.vote_up
      }
      @link.comments << comment2
      
      @link.save

      @link.reload
      @link.score.should == 3

    end
  end
end