require 'rails_helper'

RSpec.describe "donations/index", type: :view do
  before(:each) do
    assign(:donations, [
      Donation.create!(),
      Donation.create!()
    ])
  end

  it "renders a list of donations" do
    render
  end
end
