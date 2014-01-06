require 'spec_helper'

describe Link do
  before(:each) do
  	@link = FactoryGirl.create(:link)
  end

  it "has a url" do
   @link.url.should be_present
  end

  it "cannot create a new link if not signed in yet" do
    visit "/"
      
    expect(page).to have_no_content "New"
  end

  # The positive and negative cases of this are also tested in the 
  # session_integration_tests_spec.rb file

  it "belongs to a user" do
    user = FactoryGirl.create(:user)
    user.links << @link
    @link.user.should == user
  end

end
