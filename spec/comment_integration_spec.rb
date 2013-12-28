require 'spec_helper.rb'

describe "the comment creation process" do
	before (:each) do
		@user = FactoryGirl.create(:user)
		@link = FactoryGirl.create(:link, :user => @user)
	end

	it "will not allow you to comment without signing in" do
		visit "/links/1"

		fill_in "comment_text", :with => "This is a comment..."

		click_button "Post Comment"

		expect(page).to have_content "You need to sign in or sign up before continuing"
	end

	it "will post a comment if properly logged in" do
		login

		visit "/links/1"

		fill_in "comment_text", :with => "This is a comment..."

		click_button "Post Comment"

		expect(page).to have_content "Comment was successfully posted"
	end

	it "will update the cumulatve score when I upvote a comment" do
		@comment = FactoryGirl.create(:comment, :user => @user, :link => @link)

		login

		visit "/links/1"

		click_link "Up"

		expect(page).to have_content "Comment successfully upvoted"

		@comment.reload
		@link.reload

		@comment.score.should == 1
		@link.score.should == 1
	end

	it "will update the cumulatve score when I downvote a comment" do
		@comment = FactoryGirl.create(:comment, :user => @user, :link => @link)

		login

		visit "/links/1"

		click_link "Down"

		expect(page).to have_content "Comment successfully downvoted"

		@comment.reload
		@link.reload

		@comment.score.should == -1
		@link.score.should == -1
	end
end