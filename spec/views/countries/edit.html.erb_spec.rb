require 'rails_helper'

RSpec.describe "countries/edit", type: :view do
  before(:each) do
    @country = assign(:country, Country.create!(
      :iso => "MyString",
      :name => "MyString",
      :region => nil
    ))
  end

  it "renders the edit country form" do
    render

    assert_select "form[action=?][method=?]", country_path(@country), "post" do

      assert_select "input[name=?]", "country[iso]"

      assert_select "input[name=?]", "country[name]"

      assert_select "input[name=?]", "country[region_id]"
    end
  end
end
