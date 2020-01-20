require 'rails_helper'

RSpec.describe "Donations", type: :request do
  let(:donation) { build_stubbed(:donation) }
  let(:grant) { build_stubbed(:grant) }
  let(:partner) { build_stubbed(:partner, grants: [grant]) }
  let(:regular_user) { build_stubbed(:user, partner: partner) }

  describe "GET /donations" do
    it "gets donations TODO: more specs" do
      sign_in regular_user
      get donations_path
      expect(response).to have_http_status(200)
    end
  end
end
