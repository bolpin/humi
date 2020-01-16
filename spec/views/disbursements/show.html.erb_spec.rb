require 'rails_helper'

RSpec.describe "disbursements/show", type: :view do
  before(:each) do
    @disbursement = assign(:disbursement, Disbursement.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
