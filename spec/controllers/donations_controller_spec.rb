require 'rails_helper'


RSpec.describe DonationsController, type: :controller do
  let(:grant) {
    build_stubbed(:grant)
  }

  let(:valid_attributes) {
    attributes_for(:donation).merge(grant_id: grant.id)
  }

  let(:invalid_attributes) {
    {}
  }

  let(:donation) {
    build_stubbed(:donation)
  }

  let(:regular_user) {
    build_stubbed(:user)
  }

  describe "GET #index" do
    it "returns a success response" do
      sign_in regular_user
      get :index, params: {} #, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      sign_in regular_user
      get :show, params: {id: donation.to_param} #, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      donation = Donation.create! valid_attributes
      get :edit, params: {id: donation.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Donation" do
        expect {
          post :create, params: {donation: valid_attributes}, session: valid_session
        }.to change(Donation, :count).by(1)
      end

      it "redirects to the created donation" do
        post :create, params: {donation: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Donation.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {donation: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested donation" do
        donation = Donation.create! valid_attributes
        put :update, params: {id: donation.to_param, donation: new_attributes}, session: valid_session
        donation.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the donation" do
        donation = Donation.create! valid_attributes
        put :update, params: {id: donation.to_param, donation: valid_attributes}, session: valid_session
        expect(response).to redirect_to(donation)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        donation = Donation.create! valid_attributes
        put :update, params: {id: donation.to_param, donation: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested donation" do
      donation = Donation.create! valid_attributes
      expect {
        delete :destroy, params: {id: donation.to_param}, session: valid_session
      }.to change(Donation, :count).by(-1)
    end

    it "redirects to the donations list" do
      donation = Donation.create! valid_attributes
      delete :destroy, params: {id: donation.to_param}, session: valid_session
      expect(response).to redirect_to(donations_url)
    end
  end

end
