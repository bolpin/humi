require 'rails_helper'

RSpec.describe "Disbursements", type: :request do
  describe "GET /disbursements" do
    it "works! (now write some real specs)" do
      get disbursements_path
      expect(response).to have_http_status(200)
    end
  end
end
