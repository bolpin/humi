require 'rails_helper'

RSpec.describe "disbursements/new", type: :view do
  before(:each) do
    assign(:disbursement, Disbursement.new())
  end

  it "renders new disbursement form" do
    render

    assert_select "form[action=?][method=?]", disbursements_path, "post" do
    end
  end
end
