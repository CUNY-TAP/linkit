require 'spec_helper'

describe "comments" do
  before(:each) do
  	@user  = FactoryGirl.create(:user)
  	@link = FactoryGirl.create(:link, user: @user)
    @comment = FactoryGirl.create(:comment)
  end

  it "has a score" do
    @comment.score.should be_present
  end

  it "belongs to a link" do
    @link.comments << @comment
    @comment.link.should be_present

  end

  it "displays all the links" do
	visit "/"
    click_link "Login"
    fill_in "user[email]", :with => @user.email
    fill_in "user[password]", :with => @user.password
    click_button "Sign in"

    click_link "#@link.url"
    expect(page).to have_content "Add Comment"

  end

  
end