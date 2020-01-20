require 'rails_helper'

RSpec.describe "disbursements/index", type: :view do

  let(:disbursement) {
    build_stubbed(:disbursement)
  }
  
  before(:each) do
    sign_in regular_user
    assign(:disbursements, [
      disbursement, disbursement
    ])
  end

  it "renders a list of disbursements" do
    render
  end
end
