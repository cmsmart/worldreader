require 'rails_helper'

RSpec.describe "countries/index", type: :view do
  before(:each) do
    assign(:countries, [
      Country.create!(
        :iso => "Iso",
        :name => "Name",
        :region => nil
      ),
      Country.create!(
        :iso => "Iso",
        :name => "Name",
        :region => nil
      )
    ])
  end

  it "renders a list of countries" do
    render
    assert_select "tr>td", :text => "Iso".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
