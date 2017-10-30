require 'rails_helper'

RSpec.describe "authors/new", type: :view do
  before(:each) do
    assign(:author, Author.new(
      :name => "MyString",
      :country => nil,
      :goodreads_id => 1,
      :bio => "MyText"
    ))
  end

  it "renders new author form" do
    render

    assert_select "form[action=?][method=?]", authors_path, "post" do

      assert_select "input[name=?]", "author[name]"

      assert_select "input[name=?]", "author[country_id]"

      assert_select "input[name=?]", "author[goodreads_id]"

      assert_select "textarea[name=?]", "author[bio]"
    end
  end
end
