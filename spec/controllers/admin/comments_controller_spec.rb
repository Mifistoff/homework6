require 'rails_helper'

RSpec.describe Admin::CommentsController, type: :controller do
  let!(:admin)             { create :admin }
  let!(:customer)          { create :user }
  let(:task)               { Task.create title: 'title1', body: 'task body', user: customer }
  let(:valid_attributes)   { { task_id: task.id, body: 'comment body' } }
  let(:invalid_attributes) { {} }

  before { sign_in admin }
  describe "POST #create" do
    context "with valid params" do
      it "creates a new Comment" do
        expect {
          post :create, params: {comment: valid_attributes}
        }.to change(Comment, :count).by(1)
        expect(Comment.last.author).to eq admin
        expect(response).to redirect_to(task_path(task))
      end
    end

    context "with invalid params" do
      it "raise error" do
        expect{
          put :create, params: { comment: {} }
        }.to raise_error(ActionController::ParameterMissing)
      end
    end
  end
end
