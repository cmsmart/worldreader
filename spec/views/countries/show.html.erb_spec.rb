require 'rails_helper'

RSpec.describe "countries/show", type: :view do
  before(:each) do
    @country = assign(:country, Country.create!(
      :iso => "Iso",
      :name => "Name",
      :region => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Iso/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
  end
end
