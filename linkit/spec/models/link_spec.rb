require 'spec_helper'

describe Link do
  before(:each) do
  	@link = FactoryGirl.create(:link)
  end

  it "has a url" do
   @link.url.should be_present
  end
end
