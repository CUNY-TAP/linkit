require 'spec_helper'

describe "CommentVoteTests" do
  before(:each) do
	@user = FactoryGirl.create(:user)
  end

  it 'can comment after creating a link' do
  	create_link_macro
  	fill_in "comment[body]",	:with => "Test message!"
  	click_button("Create Comment")
  	page.should have_content "Test message!"
  end

  it 'can upvote' do
  	create_link_macro
  	fill_in "comment[body]",	:with => "Test message!"
  	click_button("Create Comment")
  	page.should have_content "Test message! - 0 Points"
  	click_link("Upvote")
  	page.should have_content "Test message! - 1 Points"
  end

  it 'can downvote' do
  	create_link_macro
  	fill_in "comment[body]",	:with => "Test message!"
  	click_button("Create Comment")
  	page.should have_content "Test message! - 0 Points"
  	click_link("Downvote")
  	page.should have_content "Test message! - -1 Points"
  end

  it 'updates comment score to link score' do
  	create_link_macro
  	fill_in "comment[body]",	:with => "Test message!"
  	click_button("Create Comment")
  	page.should have_content "Link Score: 0"
  	click_link("Upvote")
  	page.should have_content "Link Score: 1"
  	click_link("Downvote")
  	page.should have_content "Link Score: 0"
  end

end

def create_link_macro
	visit "/users/sign_in"
	fill_in "user[email]", 		:with => @user.email
	fill_in "user[password]", 	:with => @user.password
	click_button("Sign in")
	visit "/links/new"
	click_button("Create Link")
	click_button("Create Link")
	fill_in "link[url]", 		:with => "http://www.gowatchit.com"
	fill_in "link[name]", 		:with => "Bernie"
	click_button("Create Link")
	page.should have_content "Link was successfully created."
end