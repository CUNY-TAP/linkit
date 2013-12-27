require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!
describe "Activities related to links" do 

	it "prompts you to sign in when trying to create a new link and" do
		visit '/'
		click_link 'New'
		expect(page).to have_content 'You need to sign in or sign up before continuing.'
	end

	it "creates a new link" do
		user = FactoryGirl.create(:user)
		login_as(user, :scope => :user)
		
		visit '/links/new'

		find("h1").should have_content 'New Link'
		link = FactoryGirl.create(:link)

		within("#new_link") do
			fill_in 'Url', :with => link.url
			fill_in 'Name', :with => link.name
		end

		click_button 'Create Link'
		
		within('.alert') do
			expect(page).to have_content 'Link was successfully created'
		end
		
		Warden.test_reset!
	end

end