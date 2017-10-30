require 'rails_helper'

RSpec.describe "countries/new", type: :view do
  before(:each) do
    assign(:country, Country.new(
      :iso => "MyString",
      :name => "MyString",
      :region => nil
    ))
  end

  it "renders new country form" do
    render

    assert_select "form[action=?][method=?]", countries_path, "post" do

      assert_select "input[name=?]", "country[iso]"

      assert_select "input[name=?]", "country[name]"

      assert_select "input[name=?]", "country[region_id]"
    end
  end
end
