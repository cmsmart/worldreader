require 'rails_helper'

RSpec.describe "books/new", type: :view do
  before(:each) do
    assign(:book, Book.new(
      :title => "MyString",
      :cover_image => "MyText",
      :summary => "MyText",
      :published_year => 1,
      :native_language => "MyString",
      :author_id => nil
    ))
  end

  it "renders new book form" do
    render

    assert_select "form[action=?][method=?]", books_path, "post" do

      assert_select "input[name=?]", "book[title]"

      assert_select "textarea[name=?]", "book[cover_image]"

      assert_select "textarea[name=?]", "book[summary]"

      assert_select "input[name=?]", "book[published_year]"

      assert_select "input[name=?]", "book[native_language]"

      assert_select "input[name=?]", "book[author_id_id]"
    end
  end
end
