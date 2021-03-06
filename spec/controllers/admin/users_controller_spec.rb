require 'rails_helper'

RSpec.describe Admin::UsersController, type: :controller do

  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      user = Admin::User.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      user = Admin::User.create! valid_attributes
      get :show, params: {id: user.to_param}, session: valid_session
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
      user = Admin::User.create! valid_attributes
      get :edit, params: {id: user.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Admin::User" do
        expect {
          post :create, params: {admin_user: valid_attributes}, session: valid_session
        }.to change(Admin::User, :count).by(1)
      end

      it "redirects to the created admin_user" do
        post :create, params: {admin_user: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Admin::User.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {admin_user: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested admin_user" do
        user = Admin::User.create! valid_attributes
        put :update, params: {id: user.to_param, admin_user: new_attributes}, session: valid_session
        user.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the admin_user" do
        user = Admin::User.create! valid_attributes
        put :update, params: {id: user.to_param, admin_user: valid_attributes}, session: valid_session
        expect(response).to redirect_to(user)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        user = Admin::User.create! valid_attributes
        put :update, params: {id: user.to_param, admin_user: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested admin_user" do
      user = Admin::User.create! valid_attributes
      expect {
        delete :destroy, params: {id: user.to_param}, session: valid_session
      }.to change(Admin::User, :count).by(-1)
    end

    it "redirects to the admin_users list" do
      user = Admin::User.create! valid_attributes
      delete :destroy, params: {id: user.to_param}, session: valid_session
      expect(response).to redirect_to(admin_users_url)
    end
  end
end
