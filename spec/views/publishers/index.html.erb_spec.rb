require 'rails_helper'

RSpec.describe "publishers/index", type: :view do
  before(:each) do
    assign(:publishers, [
      Publisher.create!(
        :name => "Name",
        :contact_person => "Contact Person",
        :description => "Description",
        :website => "Website",
        :user => nil
      ),
      Publisher.create!(
        :name => "Name",
        :contact_person => "Contact Person",
        :description => "Description",
        :website => "Website",
        :user => nil
      )
    ])
  end

  it "renders a list of publishers" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Contact Person".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Website".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
