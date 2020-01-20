require 'rails_helper'

RSpec.describe DisbursementsController, type: :controller do

  # let(:partner) {
  #   build_stubbed(:partner)
  # }

  let(:grant) {
    build_stubbed(:grant)
  }

  let(:valid_attributes) {
    attributes_for(:disbursement).merge(grant_id: grant.id)
  }

  let(:invalid_attributes) {
    {}
  }

  let(:disbursement) {
    build_stubbed(:disbursement)
  }

  let(:regular_user) {
    build_stubbed(:user)
  }

  describe "GET #index" do
    it "returns a success response" do
      sign_in regular_user
      get :index, params: {} 
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: {id: disbursement.to_param}
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
      disbursement = Disbursement.create! valid_attributes
      get :edit, params: {id: disbursement.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Disbursement" do
        expect {
          post :create, params: {disbursement: valid_attributes}, session: valid_session
        }.to change(Disbursement, :count).by(1)
      end

      it "redirects to the created disbursement" do
        post :create, params: {disbursement: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Disbursement.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {disbursement: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested disbursement" do
        disbursement = Disbursement.create! valid_attributes
        put :update, params: {id: disbursement.to_param, disbursement: new_attributes}, session: valid_session
        disbursement.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the disbursement" do
        disbursement = Disbursement.create! valid_attributes
        put :update, params: {id: disbursement.to_param, disbursement: valid_attributes}, session: valid_session
        expect(response).to redirect_to(disbursement)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        disbursement = Disbursement.create! valid_attributes
        put :update, params: {id: disbursement.to_param, disbursement: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested disbursement" do
      disbursement = Disbursement.create! valid_attributes
      expect {
        delete :destroy, params: {id: disbursement.to_param}, session: valid_session
      }.to change(Disbursement, :count).by(-1)
    end

    it "redirects to the disbursements list" do
      disbursement = Disbursement.create! valid_attributes
      delete :destroy, params: {id: disbursement.to_param}, session: valid_session
      expect(response).to redirect_to(disbursements_url)
    end
  end

end
