require 'rails_helper'

RSpec.describe "disbursements/index", type: :view do

  let(:disbursement) { build_stubbed(:disbursement) }
  let(:grant) { build_stubbed(:grant) }
  let(:partner) { build_stubbed(:partner, grants: [grant]) }
  let(:regular_user) { build_stubbed(:user, partner: partner) }
  
  before(:each) do
    view.stub(:current_user) { regular_user }
    assign(:disbursements, [
      disbursement, disbursement
    ])
  end

  it "renders a list of disbursements" do
    render
  end
end
