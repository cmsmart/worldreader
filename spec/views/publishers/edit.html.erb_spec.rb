require 'rails_helper'

RSpec.describe "publishers/edit", type: :view do
  before(:each) do
    @publisher = assign(:publisher, Publisher.create!(
      :name => "MyString",
      :contact_person => "MyString",
      :description => "MyString",
      :website => "MyString",
      :user => nil
    ))
  end

  it "renders the edit publisher form" do
    render

    assert_select "form[action=?][method=?]", publisher_path(@publisher), "post" do

      assert_select "input[name=?]", "publisher[name]"

      assert_select "input[name=?]", "publisher[contact_person]"

      assert_select "input[name=?]", "publisher[description]"

      assert_select "input[name=?]", "publisher[website]"

      assert_select "input[name=?]", "publisher[user_id]"
    end
  end
end
