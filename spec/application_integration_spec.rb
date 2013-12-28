require 'spec_helper.rb'

describe "the login process" do
	before :each do 
		@user = FactoryGirl.create(:user)
		@user.save
	end

	it "logs me in when I have a correct username and password" do
		login 

		expect(page).to have_content 'Signed in successfully'
	end

	it "does not log me in when I have an incorrect username or password" do
		login "nothere@test.com", "notmypassword"

		expect(page).to have_content 'Invalid email or password'
	end

	it "logs me out" do
		login

		click_link "Logout"

		expect(page).to have_content 'Signed out successfully'
	end
end