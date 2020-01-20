require 'rails_helper'

RSpec.describe "disbursements/show", type: :view do

  let(:disbursement) {
    build_stubbed(:disbursement)
  }

  before(:each) do
    @disbursement = disbursement
  end

  it "renders attributes in <p>" do
    render
  end
end
