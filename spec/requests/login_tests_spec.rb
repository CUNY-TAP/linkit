require 'spec_helper'

describe "LoginTests" do
	before(:each) do
		@user = FactoryGirl.create(:user)
	end

	it "has a login account" do
		@user.email.should == "test@example.com"
	end

	it "has a password" do
		@user.password.should == "blahblah"
	end

	it "logs in without filling in account info" do
		visit "/"
		click_link "Login"
		click_button "Sign in" 
		expect(page).to have_content "Invalid email or password"
	end

	it "logs in with INVAILD account" do
		visit "/"
		click_link "Login"
		fill_in "user[email]", 		:with => "notauser@nil.com"
		fill_in "user[password]", 	:with => "badpassword"
		click_button("Sign in")
		expect(page).to have_content "Invalid email or password"
	end

	it "logs in with VAILD account" do
		visit "/"
		click_link "Login"
		fill_in "user[email]", 		:with => @user.email
		fill_in "user[password]", 	:with => @user.password
		click_button("Sign in")
		expect(page).to have_content "Signed in successfully."
	end
end
