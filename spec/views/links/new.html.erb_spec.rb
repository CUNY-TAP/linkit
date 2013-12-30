require 'spec_helper'

describe "links/new" do
  before(:each) do
    assign(:link, stub_model(Link,
      :url => "MyString",
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new link form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", links_path, "post" do
      assert_select "input#link_url[name=?]", "link[url]"
      assert_select "input#link_name[name=?]", "link[name]"
    end
  end
end
