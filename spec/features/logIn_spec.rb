require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe "Root path will show ability to login" do
	
	it "should show login link" do
		visit '/'
		within('.sidebar-nav') do
			expect(page).to have_content 'Login'	
		end
	end

	it "should show us the login for after click" do
		visit '/'
		click_link 'Login'
		expect(page).to have_content 'Sign in'
	end

	it "must be able to log in" do
		visit 'users/sign_in'
		user = FactoryGirl.create(:user)

		fill_in 'Email', :with => user.email
		fill_in 'Password', :with => user.password
		
		click_on 'Sign in'
		within('.alert') do
			expect(page).to have_content 'Signed in successfully'
		end
		
		Warden.test_reset!
	end


	it "must be able to log out" do
		user = FactoryGirl.create(:user)
		login_as(user, :scope => :user)
		visit('/')
		
		expect(page).to have_content 'Logout'
		click_link 'Logout'

		within('.alert') do 
			expect(page).to have_content 'Signed out successfully'
		end

		Warden.test_reset!
	end
end