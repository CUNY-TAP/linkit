require 'spec_helper'

describe "comments" do
  before(:each) do
    @user  = FactoryGirl.create(:user)
    @link = FactoryGirl.create(:link, user: @user)
    @comment = FactoryGirl.create(:comment)
  end

  it "has a score" do
    @comment.score.should be_present
  end

  it "belongs to a link" do
    @link.comments << @comment
    @comment.link.should be_present

  end

  it "is able to add a new comment" do
    visit "/"
    click_link "Login"
    fill_in "user[email]", :with => @user.email
    fill_in "user[password]", :with => @user.password
    click_button "Sign in"

    first(:link, @link.url).click
    click_link "Add Comment"


    fill_in "comment[comment]", :with => "Testing for Comment"
    click_button "Create Comment"

    expect(page).to have_content 'Comment was successfully created'

  end

  it "is able to vote up a comment" do
    @user.links << @link
    @link.comments << @comment

    visit "/"
    click_link "Login"
    fill_in "user[email]", :with => @user.email
    fill_in "user[password]", :with => @user.password
    click_button "Sign in"

    visit "links/#{@link.id}"

    expect(page).to have_content "#{@comment.comment}"
    expect(page).to have_content  "Score: 0"
    expect(page).to have_content  "Votes: 0"
    expect(page).to have_content  "Vote Up"

    click_link "Vote Up"

    expect(page).to have_content "Voting was successful."
    expect(page).to have_content  "Score: 1"
    expect(page).to have_content  "Votes: 1"

  end
  
end