require 'rails_helper'

RSpec.describe "donations/show", type: :view do
  before(:each) do
    @donation = assign(:donation, Donation.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
