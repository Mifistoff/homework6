require 'rails_helper'

RSpec.describe Admin::AdminsController, type: :controller do

  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      admin = Admin::Admin.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      admin = Admin::Admin.create! valid_attributes
      get :show, params: {id: admin.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      admin = Admin::Admin.create! valid_attributes
      get :edit, params: {id: admin.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Admin::Admin" do
        expect {
          post :create, params: {admin_admin: valid_attributes}, session: valid_session
        }.to change(Admin::Admin, :count).by(1)
      end

      it "redirects to the created admin_admin" do
        post :create, params: {admin_admin: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Admin::Admin.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {admin_admin: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested admin_admin" do
        admin = Admin::Admin.create! valid_attributes
        put :update, params: {id: admin.to_param, admin_admin: new_attributes}, session: valid_session
        admin.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the admin_admin" do
        admin = Admin::Admin.create! valid_attributes
        put :update, params: {id: admin.to_param, admin_admin: valid_attributes}, session: valid_session
        expect(response).to redirect_to(admin)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        admin = Admin::Admin.create! valid_attributes
        put :update, params: {id: admin.to_param, admin_admin: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested admin_admin" do
      admin = Admin::Admin.create! valid_attributes
      expect {
        delete :destroy, params: {id: admin.to_param}, session: valid_session
      }.to change(Admin::Admin, :count).by(-1)
    end

    it "redirects to the admin_admins list" do
      admin = Admin::Admin.create! valid_attributes
      delete :destroy, params: {id: admin.to_param}, session: valid_session
      expect(response).to redirect_to(admin_admins_url)
    end
  end
end
