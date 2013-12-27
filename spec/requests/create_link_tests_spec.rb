require 'spec_helper'

describe "CreateLinkTests" do
	before(:each) do
		@user = FactoryGirl.create(:user)
	end

	#This should prompt you to log in first
	it "tries creating without logging in" do
		visit "/links/new"
		page.should have_content "You need to sign in or sign up before continuing"
	end

	it "creates a link with a blank fields" do
		login_macro
		click_button("Create Link")
		page.should have_content "Url can't be blank"
	end

	it "creates a link with a URL with no name field" do
		login_macro
		click_button("Create Link")
		fill_in "link[url]", 		:with => "http://www.gowatchit.com"
		click_button("Create Link")
		page.should have_content "Link was successfully created."
	end

	it "creates a link with a URL with a NAME" do
		login_macro
		click_button("Create Link")
		fill_in "link[url]", 		:with => "http://www.gowatchit.com"
		fill_in "link[name]", 		:with => "Bernie"
		click_button("Create Link")
		page.should have_content "Link was successfully created."
	end

end

#Logging in with valid account before trying to create a link.
def login_macro
	visit "/users/sign_in"
	fill_in "user[email]", 		:with => @user.email
	fill_in "user[password]", 	:with => @user.password
	click_button("Sign in")
	visit "/links/new"
	click_button("Create Link")
end