require 'rails_helper'

RSpec.describe "Disbursements", type: :request do
  let(:donation) { build_stubbed(:donation) }
  let(:grant) { build_stubbed(:grant) }
  let(:partner) { build_stubbed(:partner, grants: [grant]) }
  let(:regular_user) { build_stubbed(:user, partner: partner) }

  describe "GET /disbursements" do
    it "redirects if user is not authenticated" do
      get disbursements_path
      expect(response).to have_http_status(302)
    end

    it "succeeds if user is signed in" do
      sign_in regular_user
      get disbursements_path
      expect(response).to have_http_status(200)
    end
  end
end
