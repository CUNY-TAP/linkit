require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe "Funcitonality of Comments" do 

	it "Allows you to add a comment to a link if signed in" do 
		user = FactoryGirl.create(:user)
		login_as(user, :score => :user)

		link = FactoryGirl.create(:link)
		
		user.links << link
		visit '/'

		click_link "#{link.url}"
		expect(page).to have_content "Add Comment"
		
		click_link "Add Comment"

		fill_in "Text", :with => "This is just a test"
		click_button "Create Comment"

		within('.alert') do 
			expect(page).to have_content 'Comment was successfully created'
		end

		Warden.test_reset!
	end
end