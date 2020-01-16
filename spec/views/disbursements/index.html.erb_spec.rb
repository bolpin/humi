require 'rails_helper'

RSpec.describe "disbursements/index", type: :view do
  before(:each) do
    assign(:disbursements, [
      Disbursement.create!(),
      Disbursement.create!()
    ])
  end

  it "renders a list of disbursements" do
    render
  end
end
