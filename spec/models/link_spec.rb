#link_spec.rb
require 'spec_helper'

describe Link do 
	before(:each) do 
		@link = FactoryGirl.create(:link)
	end

	it "should have a url" do
		@link.url.should be_present
	end

	it "should have a name" do 
		@link.name.should be_present
	end

	it "should start with a 0 cummulative score" do 
		@link.cumscore.should be == 0
	end
	
	it "should have a comment" do 
		link = FactoryGirl.create(:link_with_comment)
		link.comments.should be_present
	end

	it "should have a total of 1 comment" do 
		link = FactoryGirl.create(:link_with_comment)
		link.comments.size.should be == 1
	end

	it "should have an updated total cummulative score" do 
		link = FactoryGirl.create(:link_with_multiple_comments)
		
		for comments in link.comments
			comments.voteUp
		end

		link.reload

		link.cumscore.should be == 2
	end		

end