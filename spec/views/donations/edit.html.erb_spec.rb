require 'rails_helper'

RSpec.describe "donations/edit", type: :view do
  let(:donation) { build_stubbed(:donation) }

  before(:each) do
    @donation = donation
  end

  it "renders the edit donation form" do
    render

    assert_select "form[action=?][method=?]", donation_path(@donation), "post" do
    end
  end
end
