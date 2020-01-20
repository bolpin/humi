require 'rails_helper'

RSpec.describe "donations/index", type: :view do
  let(:donation) { build_stubbed(:donation) }
  let(:grant) { build_stubbed(:grant) }
  let(:partner) { build_stubbed(:partner, grants: [grant]) }
  let(:regular_user) { build_stubbed(:user, partner: partner) }

  before(:each) do
    view.stub(:current_user) { regular_user }

    assign(:donations, [
      donation, donation
    ])
  end

  it "renders a list of donations" do
    render
  end
end
