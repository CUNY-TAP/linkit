require 'spec_helper'

describe "links/show" do
  before(:each) do
    @link = assign(:link, stub_model(Link,
      :url => "Url",
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    expect(rendered).to match(/Url/)
    expect(rendered).to match(/Name/)
  end
end
