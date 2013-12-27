require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe "Voting system" do

	it "should vote a comment up" do 
		user = FactoryGirl.create(:user)
		login_as(user, :scope => :user)

		link = FactoryGirl.create(:link)
		comment = FactoryGirl.create(:comment)
		
		user.links << link
		link.comments << comment

		visit("links/#{link.id}")


		within('.dl-horizontal') do
			expect(page).to have_content "Votes: 0"
		end

		expect(page).to have_content "#{comment.text}"
		expect(page).to have_content "Votes: 0"
		expect(page).to have_content "Vote Up"
		
		click_link "Vote Up"

		within('.alert') do
			expect(page).to have_content "Voting Up was successfull"
		end
		expect(page).to have_content "Votes: 1"
		
		within('.dl-horizontal') do
			expect(page).to have_content "Votes: 1"
		end		

		Warden.test_reset!
	end

	it "should vote a comment down" do
		user = FactoryGirl.create(:user)
		login_as(user, :scope => :user)

		link = FactoryGirl.create(:link)
		comment = FactoryGirl.create(:comment)
		
		user.links << link
		link.comments << comment

		visit("links/#{link.id}")


		within('.dl-horizontal') do
			expect(page).to have_content "Votes: 0"
		end

		expect(page).to have_content "#{comment.text}"
		expect(page).to have_content "Votes: 0"
		expect(page).to have_content "Vote Down"
		
		click_link "Vote Down"

		within('.alert') do
			expect(page).to have_content "Voting Down was successfull"
		end
		expect(page).to have_content "Votes: -1"
		
		within('.dl-horizontal') do
			expect(page).to have_content "Votes: -1"
		end		

		Warden.test_reset!
	end
end
