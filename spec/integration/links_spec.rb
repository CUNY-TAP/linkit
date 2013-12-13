require 'spec_helper'
describe "home page" do
  it "displays all the links" do
 
    visit "/links"

    expect(page).to have_content "All links"
    expect(page).to_not have_content "Sign in"
 
  end

  it "requires login to create new links" do
  	
  end
end