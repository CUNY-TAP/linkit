require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe "Links" do
  before (:each) do
  	@user= FactoryGirl.create(:user)
    @link = FactoryGirl.create(:link)
  end
  describe "GET /links" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get links_path
      expect(response.status).to be(200)
      Warden.test_reset! 
    end
  end

  it "gets a login page when trying to add a link" do
  	visit root_path
  	click_link("New")
  	page.should have_content "You need to sign in"
  	Warden.test_reset! 
  end
  
  it "can log in and log out without problems" do
  	visit root_path
  	click_link("Login")
  	fill_in 'Email', with: 'testEmail@test.com'
  	fill_in 'Password', with: '12345678'
  	click_button 'Sign in'
  	page.should have_content "Signed in successfully."
  	click_link 'Logout'
  	page.should have_content "Signed out successfully."
  	Warden.test_reset! 
  end

  it "can create a link when logged in" do
	  login_as(@user, :scope => :user)
	  visit root_path
	  click_link("New")
	  fill_in 'Url', with: 'test.com'
  	fill_in 'Name', with: 'test link'
  	click_button 'Create Link'
  	page.should have_content "Link was successfully created."
    Warden.test_reset!
  end

  it "can add a comment when logged in" do
    login_as(@user, :scope => :user)
    visit root_path
    click_link("url")
    fill_in 'comment_body', with: 'test message'
    click_button 'Create Comment'
    page.should have_content "test message"
    page.should have_content "Upvote"
    page.should have_content "Downvote"
    page.should have_content "Delete Comment"
    Warden.test_reset!
  end

  it "updates cumulative score when a comment is up or down voted" do
    login_as(@user, :scope => :user)
    FactoryGirl.create(:comment)
    visit root_path
    click_link("url")
    click_link("Upvote")
    click_link("Upvote")
    @link = Link.find(1)
    @link.score.should be ==2
    click_link("Downvote")
    click_link("Downvote")
    click_link("Downvote")
    @link = Link.find(1)
    @link.score.should be ==-1
    Warden.test_reset!
  end



end
