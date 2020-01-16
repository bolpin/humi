require 'rails_helper'

RSpec.describe "donations/new", type: :view do
  before(:each) do
    assign(:donation, Donation.new())
  end

  it "renders new donation form" do
    render

    assert_select "form[action=?][method=?]", donations_path, "post" do
    end
  end
end
