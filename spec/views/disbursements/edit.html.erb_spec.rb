require 'rails_helper'

RSpec.describe "disbursements/edit", type: :view do
  let(:disbursement) { build_stubbed(:disbursement) }
  let(:grant) { build_stubbed(:grant) }
  let(:partner) { build_stubbed(:partner, grants: [grant]) }
  let(:regular_user) { build_stubbed(:user, partner: partner) }

    # view.stub(:current_user) { regular_user }

  before(:each) do
    @disbursement = disbursement
  end

  it "renders the edit disbursement form" do
    render

    assert_select "form[action=?][method=?]", disbursement_path(@disbursement), "post" do
    end
  end
end
