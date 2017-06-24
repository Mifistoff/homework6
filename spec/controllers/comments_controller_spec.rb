require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let!(:user)              { create :user }
  let(:task)               { Task.create title: 'title1', body: 'task body', user: user }
  let(:valid_attributes)   { { task_id: task.id, body: 'comment body' } }
  let(:invalid_attributes) { {} }
  let(:valid_session)      { {} }

  before { sign_in user }
  describe "POST #create" do
    context "with valid params" do
      it "creates a new Comment" do
        expect {
          post :create, params: {comment: valid_attributes}, session: valid_session
        }.to change(Comment, :count).by(1)
        expect(Comment.last.author).to eq user
      end

      it "redirects to the created comment" do
        post :create, params: {comment: valid_attributes}, session: valid_session
        expect(response).to redirect_to(task_path(task))
      end
    end

    context "with invalid params" do
      it "raise error" do
        expect{
          put :create, params: { comment: {} }, session: valid_session
        }.to raise_error(ActionController::ParameterMissing)
      end
    end
  end
end
