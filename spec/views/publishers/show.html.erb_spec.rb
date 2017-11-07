require 'rails_helper'

RSpec.describe "publishers/show", type: :view do
  before(:each) do
    @publisher = assign(:publisher, Publisher.create!(
      :name => "Name",
      :contact_person => "Contact Person",
      :description => "Description",
      :website => "Website",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Contact Person/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Website/)
    expect(rendered).to match(//)
  end
end
