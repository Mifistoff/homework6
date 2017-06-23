require 'rails_helper'

RSpec.describe Admin::CommentsController, type: :controller do
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

  describe "GET #show" do
    it "returns a success response" do
      comment = Comment.create! valid_attributes
      get :show, params: {id: comment.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Comment" do
        expect {
          post :create, params: {comment: valid_attributes}, session: valid_session
        }.to change(Comment, :count).by(1)
      end

      it "redirects to the created comment" do
        post :create, params: {comment: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Comment.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {comment: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end
end
