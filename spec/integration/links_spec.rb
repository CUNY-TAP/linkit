require 'spec_helper'

describe "home page" do
  before(:each) do
    FactoryGirl.create(:link)
  end
  it "displays all the links" do
 
    visit "/links"

    within("h1") do
      expect(page).to have_content "All links"
    end
    within(".table") do
      expect(page).to have_content "cool link"
    end
  end

  it "requires login to create new links" do
    visit "/links"

    click_link "New"  	

    expect(page).to have_content "You need to sign in or sign up before continuing."
  
  end
end