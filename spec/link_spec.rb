require 'spec_helper.rb'

describe "the link creation process" do

	it "will not allow me to create a link if not logged in" do
		visit "/"

		click_link "New"

		expect(page).to have_content "You need to sign in or sign up before continuing"
	end

	it "will allow me to create a link if logged in" do
	 	@user = FactoryGirl.create(:user)
		@user.save

		login "test@test.com", "password"

		click_link "New"

		within ("form") do
			fill_in "Url", :with => "somelink.com"
			fill_in "Name", :with => "My Favorite Site"
		end

		click_button "Create Link"

		expect(page).to have_content "Link was successfully created."
	end

	def login(email, password)
		visit "/"
		click_link "Login"

		within("form") do
			fill_in "Email", :with => email
			fill_in "Password", :with => password
		end

		click_button "Sign in"
	end
end